#!/usr/bin/env bash
#
# smoke-noninteractive.sh — verify the non-interactive install path.
#
# Runs install.sh inside an Ubuntu container with NO TTY (piped) and
# NikanDeveloper_NONINTERACTIVE=1, then asserts:
#   * /etc/nikan-developer/install-result.env exists (mode 600) with random, non-default creds
#   * the panel reports hasDefaultCredential: false (no admin/admin remains)
#   * the panel HTTP server actually serves on the generated port/base path
#   * with a [version] argument: the installed binary reports exactly that version
#
# Requires Docker and network access (install.sh downloads the released binary).
# Usage: bash deploy/test/smoke-noninteractive.sh [version]
#   With no argument install.sh resolves releases/latest. Pass an explicit tag
#   (e.g. v3.4.2) to verify that exact release — the tag-triggered CI run does
#   this so it cannot silently validate the previous release (#5756).
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
IMAGE="${SMOKE_IMAGE:-ubuntu:24.04}"
NikanDeveloper_SMOKE_VERSION="${1:-}"

if ! command -v docker > /dev/null 2>&1; then
    echo "ERROR: docker is required for this smoke test." >&2
    exit 1
fi

echo "== non-interactive install smoke test (image: $IMAGE, version: ${NikanDeveloper_SMOKE_VERSION:-latest}) =="

docker run --rm \
    -v "${REPO_ROOT}/install.sh:/root/install.sh:ro" \
    -e NikanDeveloper_NONINTERACTIVE=1 \
    -e NikanDeveloper_SSL_MODE=none \
    -e NikanDeveloper_SMOKE_VERSION="$NikanDeveloper_SMOKE_VERSION" \
    -e DEBIAN_FRONTEND=noninteractive \
    "$IMAGE" bash -euo pipefail -c '
        apt-get update -qq
        apt-get install -y -qq curl tar openssl ca-certificates > /dev/null

        echo "--- running install.sh piped (no TTY), version: ${NikanDeveloper_SMOKE_VERSION:-latest} ---"
        # Piping guarantees stdin is not a TTY, exercising the auto non-interactive path.
        if [ -n "${NikanDeveloper_SMOKE_VERSION:-}" ]; then
            cat /root/install.sh | bash -s -- "$NikanDeveloper_SMOKE_VERSION"
        else
            cat /root/install.sh | bash
        fi

        echo "--- assertions ---"
        if [ -n "${NikanDeveloper_SMOKE_VERSION:-}" ]; then
            installed=$(/usr/local/nikan-developer/nikan-developer -v)
            [ "$installed" = "${NikanDeveloper_SMOKE_VERSION#v}" ] \
                || { echo "FAIL: installed version $installed, want ${NikanDeveloper_SMOKE_VERSION#v}"; exit 1; }
        fi

        RESULT=/etc/nikan-developer/install-result.env
        test -f "$RESULT" || { echo "FAIL: $RESULT missing"; exit 1; }

        perms=$(stat -c %a "$RESULT")
        [ "$perms" = "600" ] || { echo "FAIL: $RESULT perms=$perms (want 600)"; exit 1; }

        # shellcheck disable=SC1090
        . "$RESULT"
        [ -n "${NikanDeveloper_USERNAME:-}" ] && [ "$NikanDeveloper_USERNAME" != "admin" ] \
            || { echo "FAIL: username missing or still admin"; exit 1; }
        [ -n "${NikanDeveloper_PASSWORD:-}" ] && [ "$NikanDeveloper_PASSWORD" != "admin" ] \
            || { echo "FAIL: password missing or still admin"; exit 1; }
        [ -n "${NikanDeveloper_PANEL_PORT:-}" ] || { echo "FAIL: port missing"; exit 1; }

        # No default admin in the DB.
        /usr/local/nikan-developer/nikan-developer setting -show | grep -q "hasDefaultCredential: false" \
            || { echo "FAIL: hasDefaultCredential is not false"; exit 1; }

        echo "--- verifying the panel serves HTTP ---"
        cd /usr/local/nikan-developer
        ./nikan-developer > /tmp/xui.log 2>&1 &
        xpid=$!
        for _ in $(seq 1 15); do
            code=$(curl -s -o /dev/null -w "%{http_code}" \
                "http://127.0.0.1:${NikanDeveloper_PANEL_PORT}/${NikanDeveloper_WEB_BASE_PATH}/" 2>/dev/null || true)
            case "$code" in 200|301|302|307|308) break ;; esac
            sleep 1
        done
        kill "$xpid" 2>/dev/null || true
        echo "panel HTTP status: ${code:-none}"
        case "${code:-}" in
            200|301|302|307|308) : ;;
            *) echo "FAIL: panel did not serve (status ${code:-none})"; tail -n 30 /tmp/xui.log; exit 1 ;;
        esac

        echo "--- verifying a second install preserves custom bin/ files ---"
        echo "custom-sentinel" > /usr/local/nikan-developer/bin/geoip_custom.dat
        geoip_sum_before=$(sha256sum /usr/local/nikan-developer/bin/geoip.dat | cut -d" " -f1)

        if [ -n "${NikanDeveloper_SMOKE_VERSION:-}" ]; then
            cat /root/install.sh | bash -s -- "$NikanDeveloper_SMOKE_VERSION"
        else
            cat /root/install.sh | bash
        fi

        test -f /usr/local/nikan-developer/bin/geoip_custom.dat \
            || { echo "FAIL: custom bin/ file did not survive a second install"; exit 1; }
        [ "$(cat /usr/local/nikan-developer/bin/geoip_custom.dat)" = "custom-sentinel" ] \
            || { echo "FAIL: custom bin/ file content changed across a second install"; exit 1; }
        geoip_sum_after=$(sha256sum /usr/local/nikan-developer/bin/geoip.dat | cut -d" " -f1)
        [ "$geoip_sum_after" = "$geoip_sum_before" ] \
            || { echo "FAIL: bundled geoip.dat changed across a same-version reinstall"; exit 1; }

        echo "SMOKE_PASS: user=$NikanDeveloper_USERNAME port=$NikanDeveloper_PANEL_PORT path=$NikanDeveloper_WEB_BASE_PATH"
    '

echo "== non-interactive smoke test PASSED =="
