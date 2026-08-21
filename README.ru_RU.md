[English](/README.md) | [فارسی](/README.fa_IR.md) | [العربية](/README.ar_EG.md) | [中文](/README.zh_CN.md) | [Español](/README.es_ES.md) | [Русский](/README.ru_RU.md) | [Türkçe](/README.tr_TR.md)

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="./media/Nikan.Developer-dark.png">
    <img alt="Nikan.Developer" src="./media/Nikan.Developer-light.png">
  </picture>
</p>

<p align="center">
  <a href="https://github.com/NikanDeveloper56/Nikan.Developer/releases"><img src="https://img.shields.io/github/v/release/nikandeveloper56/Nikan.Developer" alt="Release"></a>
  <a href="https://github.com/NikanDeveloper56/Nikan.Developer/actions"><img src="https://img.shields.io/github/actions/workflow/status/nikandeveloper56/Nikan.Developer/release.yml.svg" alt="Build"></a>
  <a href="#"><img src="https://img.shields.io/github/go-mod/go-version/nikandeveloper56/Nikan.Developer.svg" alt="GO Version"></a>
  <a href="https://github.com/NikanDeveloper56/Nikan.Developer/releases/latest"><img src="https://img.shields.io/github/downloads/nikandeveloper56/Nikan.Developer/total.svg" alt="Downloads"></a>
  <a href="https://www.gnu.org/licenses/gpl-3.0.en.html"><img src="https://img.shields.io/badge/license-GPL%20V3-blue.svg?longCache=true" alt="License"></a>
  <a href="https://pkg.go.dev/github.com/nikandeveloper56/Nikan.Developer/v3"><img src="https://pkg.go.dev/badge/github.com/nikandeveloper56/Nikan.Developer/v3.svg" alt="Go Reference"></a>
</p>

**Nikan.Developer** — продвинутая веб-панель управления с открытым исходным кодом для управления серверами [Xray-core](https://github.com/XTLS/Xray-core). Она предоставляет аккуратный многоязычный интерфейс для развёртывания, настройки и мониторинга широкого спектра протоколов прокси и VPN — от одного VPS до развёртываний с несколькими узлами.

Созданный как улучшенный форк оригинального проекта Nikan.Developer, Nikan.Developer добавляет более широкую поддержку протоколов, повышенную стабильность, учёт трафика по каждому клиенту и множество функций для удобства использования.

> [!IMPORTANT]
> Этот проект предназначен только для личного использования. Пожалуйста, не используйте его в незаконных целях или в производственной среде.

## Возможности

- **Многопротокольные входящие подключения** — VLESS, VMess, Trojan, Shadowsocks, WireGuard, Hysteria2, HTTP, SOCKS (Mixed), Dokodemo-door / Tunnel и TUN.
- **Современные транспорты и безопасность** — TCP (Raw), mKCP, WebSocket, gRPC, HTTPUpgrade и XHTTP, защищённые с помощью TLS, XTLS и REALITY.
- **Fallback** — обслуживание нескольких протоколов на одном порту (например, VLESS и Trojan на 443) с помощью функции fallback в Xray.
- **Управление по каждому клиенту** — квоты трафика, даты истечения, лимиты IP, статус «онлайн» в реальном времени, а также ссылки для общего доступа, QR-коды и подписки в один клик.
- **Статистика трафика** — по каждому входящему, по каждому клиенту и по каждому исходящему, с возможностью сброса.
- **Поддержка нескольких узлов** — управление и масштабирование на несколько серверов из одной панели.
- **Исходящие подключения и маршрутизация** — WARP, NordVPN, пользовательские правила маршрутизации, балансировщики нагрузки и цепочки исходящих прокси.
- **Встроенный сервер подписок** с несколькими форматами вывода и [пользовательскими шаблонами страниц](docs/custom-subscription-templates.md).
- **Telegram-бот** для удалённого мониторинга и управления.
- **RESTful API** с документацией Swagger внутри панели.
- **Гибкое хранилище** — SQLite (по умолчанию) или PostgreSQL.
- **13 языков интерфейса** с тёмной и светлой темами.
- **Интеграция с Fail2ban** для применения лимитов IP по каждому клиенту.

## Скриншоты

<details>
<summary>Нажмите, чтобы развернуть</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./media/01-overview-dark.png">
  <img alt="Overview" src="./media/01-overview-light.png">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./media/02-add-inbound-dark.png">
  <img alt="Inbounds" src="./media/02-add-inbound-light.png">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./media/03-add-client-dark.png">
  <img alt="Add client" src="./media/03-add-client-light.png">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./media/05-add-nodes-dark.png">
  <img alt="Configs" src="./media/05-add-nodes-light.png">
</picture>

</details>

## Быстрый старт

```bash
bash <(curl -Ls https://raw.githubusercontent.com/nikandeveloper56/Nikan.Developer/master/install.sh)
```

Чтобы установить конкретную версию, добавьте её тег (например, `v3.4.0`):

```bash
bash <(curl -Ls https://raw.githubusercontent.com/nikandeveloper56/Nikan.Developer/master/install.sh) v3.4.0
```

Чтобы установить скользящую **dev**-сборку (новейший предварительный релиз по каждому коммиту из ветки `main`, а не стабильный релиз), передайте `dev-latest`:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/nikandeveloper56/Nikan.Developer/master/install.sh) dev-latest
```

Во время установки генерируются случайные имя пользователя, пароль и путь доступа. После установки выполните `nikan-developer`, чтобы открыть меню управления, где можно запускать/останавливать сервис, просматривать или сбрасывать учётные данные для входа, управлять SSL-сертификатами и многое другое.

Полную документацию смотрите в [вики проекта](https://github.com/NikanDeveloper56/Nikan.Developer/wiki).

### Автоматическая установка

Установщик также работает в **неинтерактивном** режиме для cloud-init.
Задайте `NikanDeveloper_NONINTERACTIVE=1` (или передайте по конвейеру без TTY), и установка пройдёт от начала до конца
без единого запроса: будут сгенерированы случайные учётные данные и записаны в
`/etc/nikan-developer/install-result.env`. Смотрите [`deploy/`](deploy/) для:

- [Cloud-init user-data](deploy/cloud-init/) — автоматическая установка в любом облаке (Hetzner/AWS/DO/Vultr/GCP/Azure/Oracle)
- [Заметки по Hetzner Cloud](deploy/marketplace/hetzner/) — развёртывание на Hetzner на базе cloud-init

## Поддерживаемые платформы

**Операционные системы:** Ubuntu, Debian, Armbian, Fedora, CentOS, RHEL, AlmaLinux, Rocky Linux, Oracle Linux, Amazon Linux, Virtuozzo, Arch, Manjaro, Parch, openSUSE (Tumbleweed / Leap), Alpine и Windows.

**Архитектуры:** `amd64` · `386` · `arm64` (aarch64) · `armv7` · `armv6` · `armv5` · `s390x`.

## Варианты базы данных

Nikan.Developer поддерживает два бэкенда, выбираемых при установке:

- **SQLite** (по умолчанию) — единый файл по пути `/etc/nikan-developer/nikan-developer.db`. Без настройки, идеально для небольших и средних развёртываний.
- **PostgreSQL** — рекомендуется при большом числе клиентов или конфигурациях с несколькими узлами. Установщик может установить PostgreSQL локально за вас или принять DSN к существующему серверу.

Во время выполнения бэкенд выбирается через переменные окружения (установщик записывает их за вас в `/etc/default/nikan-developer`):

```
NikanDeveloper_DB_TYPE=postgres
NikanDeveloper_DB_DSN=postgres://xui:password@127.0.0.1:5432/xui?sslmode=disable
```

### Перенос существующей установки SQLite в PostgreSQL

```bash
nikan-developer migrate-db --dsn "postgres://xui:password@127.0.0.1:5432/xui?sslmode=disable"
# затем задайте NikanDeveloper_DB_TYPE и NikanDeveloper_DB_DSN в /etc/default/nikan-developer и перезапустите:
systemctl restart nikan-developer
```

Исходный файл SQLite остаётся нетронутым; удалите его вручную после проверки нового бэкенда.

### Docker

Команда по умолчанию `docker compose up -d` продолжает использовать SQLite. Чтобы запустить со встроенным сервисом PostgreSQL, раскомментируйте две строки переменных окружения `NikanDeveloper_DB_*` в `docker-compose.yml` и запустите с профилем:

```bash
docker compose --profile postgres up -d
```

Образ включает Fail2ban (включён по умолчанию) для применения **лимитов IP** по каждому клиенту. Fail2ban блокирует нарушителей с помощью `iptables`, что требует возможности `NET_ADMIN`. `docker-compose.yml` уже предоставляет её через `cap_add`; если вы вместо этого запускаете контейнер через `docker run`, добавьте возможности самостоятельно, иначе блокировки будут регистрироваться, но никогда не применяться:

```bash
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW ... ghcr.io/nikandeveloper56/Nikan.Developer
```

## Переменные окружения

| Переменная | Описание | По умолчанию |
| --- | --- | --- |
| `NikanDeveloper_DB_TYPE` | Бэкенд базы данных: `sqlite` или `postgres` | `sqlite` |
| `NikanDeveloper_DB_DSN` | Строка подключения PostgreSQL (когда `NikanDeveloper_DB_TYPE=postgres`) | — |
| `NikanDeveloper_DB_FOLDER` | Каталог для файла базы данных SQLite | `/etc/nikan-developer` |
| `NikanDeveloper_DB_MAX_OPEN_CONNS` | Максимум открытых соединений (пул PostgreSQL) | — |
| `NikanDeveloper_DB_MAX_IDLE_CONNS` | Максимум простаивающих соединений (пул PostgreSQL) | — |
| `NikanDeveloper_INIT_WEB_BASE_PATH` | Начальный URI-путь для веб-панели | `/` |
| `NikanDeveloper_ENABLE_FAIL2BAN` | Включить применение лимитов IP на основе Fail2ban | `true` |
| `NikanDeveloper_LOG_LEVEL` | Уровень логирования (`debug`, `info`, `warning`, `error`) | `info` |
| `NikanDeveloper_DEBUG` | Включить режим отладки | `false` |
| `NikanDeveloper_TUNNEL_HEALTH_MONITOR` | Включить монитор состояния туннеля (опрашивает URL и перезапускает xray после многократных сбоев; перезапуск отключает всех клиентов) | `false` |
| `NikanDeveloper_TUNNEL_HEALTH_PROXY` | Прокси, через который отправляется проба; укажите локальный входящий xray, чтобы проба проверяла туннель (например, `socks5://127.0.0.1:1080`). Пустое значение означает, что проба проверяет только связь с хостом | — |
| `NikanDeveloper_TUNNEL_HEALTH_URL` | URL, опрашиваемый для проверки состояния туннеля | `https://www.cloudflare.com/cdn-cgi/trace` |
| `NikanDeveloper_TUNNEL_HEALTH_INTERVAL` | Интервал между пробами | `30s` |
| `NikanDeveloper_TUNNEL_HEALTH_TIMEOUT` | Таймаут на одну пробу | `10s` |
| `NikanDeveloper_TUNNEL_HEALTH_FAILURES` | Число последовательных сбоев до запуска перезапуска | `3` |
| `NikanDeveloper_TUNNEL_HEALTH_COOLDOWN` | Минимальная задержка между последовательными перезапусками | `5m` |

## Поддерживаемые языки

Интерфейс панели доступен на 13 языках:

English · فارسی · العربية · 中文（简体） · 中文（繁體） · Español · Русский · Українська · Türkçe · Tiếng Việt · 日本語 · Bahasa Indonesia · Português (Brasil)

## Участие в разработке

Вклад приветствуется. Пожалуйста, прочитайте [руководство по участию](/CONTRIBUTING.md), прежде чем открывать issue или pull request.

## Особая благодарность

- [alireza0](https://github.com/alireza0/)

## Благодарности

- [Iran v2ray rules](https://github.com/chocolate4u/Iran-v2ray-rules) (Лицензия: **GPL-3.0**): _Улучшенные правила маршрутизации для v2ray/xray и v2ray/xray-clients со встроенными иранскими доменами и фокусом на безопасность и блокировку рекламы._
- [Russia v2ray rules](https://github.com/runetfreedom/russia-v2ray-rules-dat) (Лицензия: **GPL-3.0**): _Этот репозиторий содержит автоматически обновляемые правила маршрутизации V2Ray на основе данных о заблокированных доменах и адресах в России._

## Инструменты сообщества

Инструменты и интеграции, созданные сообществом вокруг Nikan.Developer.

- [terraform-provider-Nikan.Developer](https://github.com/batonogov/terraform-provider-threexui) (Лицензия: **MIT**): _Управление входящими, клиентами, настройками панели и конфигурацией Xray через код с помощью Terraform / OpenTofu._

## Поддержка проекта

**Если этот проект полезен для вас, вы можете поставить ему**:star2:

<a href="https://www.buymeacoffee.com/NikanDeveloper56" target="_blank">
<img src="./media/default-yellow.png" alt="Buy Me A Coffee" style="height: 70px !important;width: 277px !important;" >
</a>

</br>
<a href="https://nowpayments.io/donation/hsanaei" target="_blank" rel="noreferrer noopener">
   <img src="./media/donation-button-black.svg" alt="Crypto donation button by NOWPayments">
</a>

## Звезды с течением времени

[![Stargazers over time](https://starchart.cc/NikanDeveloper56/Nikan.Developer.svg?variant=adaptive)](https://starchart.cc/NikanDeveloper56/Nikan.Developer)
