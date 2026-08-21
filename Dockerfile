# ========================================================
# Stage: Frontend (Vite)
# ========================================================
FROM --platform=$BUILDPLATFORM node:22-alpine AS frontend
WORKDIR /src/frontend
COPY frontend/package.json frontend/package-lock.json ./
RUN npm ci
COPY frontend/ ./
COPY internal/web/translation /src/internal/web/translation
RUN npm run build

# ========================================================
# Stage: Builder (Go)
# ========================================================
FROM golang:1.26-alpine AS builder
WORKDIR /app
ARG TARGETARCH

RUN apk --no-cache --update add \
  build-base \
  gcc \
  curl \
  unzip

COPY . .
COPY --from=frontend /src/internal/web/dist ./internal/web/dist

ENV CGO_ENABLED=1
ENV CGO_CFLAGS="-D_LARGEFILE64_SOURCE"
RUN go build -ldflags "-w -s" -o build/nikan-developer main.go

# ========================================================
# Stage: Final Runtime Image
# ========================================================
FROM alpine
ENV TZ=Asia/Tehran
WORKDIR /app

RUN apk add --no-cache --update \
  ca-certificates \
  tzdata \
  bash \
  curl \
  openssl

COPY --from=builder /app/build/nikan-developer /app/nikan-developer
COPY --from=builder /app/DockerEntrypoint.sh /app/DockerEntrypoint.sh
COPY --from=builder /app/nikan-developer.sh /usr/bin/nikan-developer
COPY --from=builder /app/internal/web/dist /app/internal/web/dist
COPY --from=builder /app/internal/web/translation /app/internal/web/translation

# پوشه دیتا داخل خودِ container (نیاز به Volume ندارد)
ENV XUI_IN_DOCKER="true"
ENV NikanDeveloper_MAIN_FOLDER="/app/data"
ENV XUI_ENABLE_FAIL2BAN="false"
ENV XUI_DB_TYPE=""
ENV XUI_DB_DSN=""
ENV XUI_PORT="8080"

RUN mkdir -p /app/data /app/bin

EXPOSE 8080
CMD ["./nikan-developer"]
