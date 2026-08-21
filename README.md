# Nikan.Developer Panel

پنل مدیریت پیشرفته VLESS / VMess / Trojan / Shadowsocks / WireGuard با پشتیبانی از Reality، WS+TLS، XHTTP و اشتراک‌های سابسکریپشن.

## ویژگی‌ها

- **اینباندهای چندپروتکله** — VLESS, VMess, Trojan, Shadowsocks, WireGuard, Hysteria2, HTTP, SOCKS, TUN
- **ترنزپورت‌های مدرن** — TCP, mKCP, WebSocket, gRPC, HTTPUpgrade, XHTTP با امنیت TLS / XTLS / REALITY
- **مدیریت کاربران** — سهمیه ترافیک، تاریخ انقضا، محدودیت IP، وضعیت آنلاین، لینک اشتراک و QR
- **پشتیبانی چندنود** — مدیریت چندین سرور از یک پنل
- **سرور اشتراک** — خروجی در فرمت‌های مختلف + قالب‌های شخصی‌سازی شده
- **ربات تلگرام** — مانیتورینگ و مدیریت از راه دور

## نصب

### Docker / Railway

```bash
git clone https://github.com/NikanDeveloper56/NikanDeveloper-Panel.git
cd NikanDeveloper-Panel
docker build -t nikan-developer .
docker run -p 8080:8080 nikan-developer
```

یا مستقیم روی Railway از ریپوی GitHub دیپلوی کنید.

### نصب دستی (Linux)

```bash
bash <(curl -Ls https://raw.githubusercontent.com/NikanDeveloper56/NikanDeveloper-Panel/main/install.sh)
```

## متغیرهای محیطی

| متغیر | توضیح | پیش‌فرض |
|------|------|---------|
| `XUI_PORT` | پورت پنل | `8080` |
| `XUI_DB_TYPE` | نوع دیتابیس (`sqlite` یا `postgres`) | `sqlite` |
| `XUI_DEBUG` | حالت دیباگ | `false` |

## برندینگ

این پروژه توسط **Nikan.Developer** (NikanDeveloper56) توسعه و نگهداری می‌شود.

- تلگرام: [@useriraniii](https://t.me/useriraniii)
- گیت‌هاب: [NikanDeveloper56](https://github.com/NikanDeveloper56)

## لایسنس

این پروژه تحت لایسنس GNU GPL v3 منتشر شده است.
