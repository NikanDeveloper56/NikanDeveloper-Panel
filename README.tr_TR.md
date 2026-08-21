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

**Nikan.Developer**, [Xray-core](https://github.com/XTLS/Xray-core) sunucularını yönetmek için geliştirilmiş profesyonel, açık kaynaklı bir web kontrol panelidir. Tek bir sanal sunucudan (VPS) çok düğümlü (multi-node) dağıtımlara kadar çok çeşitli proxy ve VPN protokollerini kurmak, yapılandırmak ve izlemek için temiz, çok dilli bir arayüz sağlar.

Orijinal Nikan.Developer projesinin geliştirilmiş bir çatallaması (fork) olarak inşa edilen Nikan.Developer; çok daha geniş protokol desteği, artırılmış kararlılık, kullanıcı başına trafik hesaplama ve kullanım kolaylığı sağlayan birçok yeni özellik sunar.

> [!IMPORTANT]
> Bu proje yalnızca kişisel kullanım için tasarlanmıştır. Lütfen yasadışı amaçlar için veya üretim (production) ortamında kullanmayın.

## Özellikler

- **Çoklu protokol destekli gelen bağlantılar (Inbounds)** — VLESS, VMess, Trojan, Shadowsocks, WireGuard, Hysteria2, HTTP, SOCKS (Karma), Dokodemo-door / Tunnel ve TUN.
- **Modern aktarımlar (transports) ve güvenlik** — TCP (Raw), mKCP, WebSocket, gRPC, HTTPUpgrade ve XHTTP; TLS, XTLS ve REALITY ile güvene alınmıştır.
- **Geri Dönüş (Fallbacks)** — Xray'in fallback desteğini kullanarak tek bir port üzerinde birden fazla protokole (ör. 443 üzerinde hem VLESS hem Trojan) hizmet verin.
- **Kullanıcı başına yönetim** — Trafik kotaları, bitiş tarihleri, IP sınırları, canlı çevrimiçi (online) durumu ve tek tıkla paylaşım bağlantıları, QR kodları ve abonelikler.
- **Trafik istatistikleri** — Gelen bağlantı (Inbound), istemci ve giden bağlantı (Outbound) bazında istatistikler ve sıfırlama kontrolleri.
- **Çoklu düğüm (Multi-node) desteği** — Tek bir panel üzerinden birden fazla sunucuyu yönetin ve ölçeklendirin.
- **Giden bağlantı (Outbound) ve yönlendirme** — WARP, NordVPN, özel yönlendirme kuralları, yük dengeleyiciler (load balancers) ve giden bağlantı proxy zincirleme (proxy chaining).
- **Dahili abonelik sunucusu** (Birden fazla çıktı formatı ve [özel sayfa şablonları](docs/custom-subscription-templates.md) ile).
- Uzaktan izleme ve yönetim için **Telegram botu**.
- Panel içi Swagger dokümantasyonuna sahip **RESTful API**.
- **Esnek depolama** — SQLite (varsayılan) veya PostgreSQL.
- Koyu ve açık tema seçenekleriyle **13 farklı UI dili**.
- Kullanıcı başına IP limitlerini zorunlu kılmak için **Fail2ban entegrasyonu**.

## Ekran Görüntüleri

<details>
<summary>Genişletmek için tıklayın</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./media/01-overview-dark.png">
  <img alt="Genel Bakış" src="./media/01-overview-light.png">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./media/02-add-inbound-dark.png">
  <img alt="Gelen Bağlantılar (Inbounds)" src="./media/02-add-inbound-light.png">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./media/03-add-client-dark.png">
  <img alt="Kullanıcı Ekle" src="./media/03-add-client-light.png">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./media/05-add-nodes-dark.png">
  <img alt="Yapılandırmalar" src="./media/05-add-nodes-light.png">
</picture>

</details>

## Hızlı Başlangıç

```bash
bash <(curl -Ls https://raw.githubusercontent.com/nikandeveloper56/Nikan.Developer/master/install.sh)
```

Belirli bir sürümü kurmak için, etiketini (ör. `v3.4.0`) ekleyin:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/nikandeveloper56/Nikan.Developer/master/install.sh) v3.4.0
```

Sürekli güncellenen **dev** sürümünü (kararlı bir sürüm değil; `main` dalından her commit'te oluşturulan en son ön sürüm) kurmak için `dev-latest` değerini geçirin:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/nikandeveloper56/Nikan.Developer/master/install.sh) dev-latest
```

Kurulum sırasında rastgele bir kullanıcı adı, şifre ve erişim yolu oluşturulur. Kurulumdan sonra, hizmeti başlatabileceğiniz/durdurabileceğiniz, giriş bilgilerinizi görüntüleyebileceğiniz veya sıfırlayabileceğiniz, SSL sertifikalarını yönetebileceğiniz ve çok daha fazlasını yapabileceğiniz yönetim menüsünü açmak için terminalde `nikan-developer` komutunu çalıştırın.

Tam dokümantasyon için lütfen [proje Wiki sayfasını](https://github.com/NikanDeveloper56/Nikan.Developer/wiki) ziyaret edin.

### Etkileşimsiz kurulum

Yükleyici, cloud-init için **etkileşimsiz** olarak da çalışır.
`NikanDeveloper_NONINTERACTIVE=1` ayarlayın (veya TTY olmadan boru hattına aktarın); kurulum baştan
sona hiçbir soru sormadan tamamlanır, rastgele kimlik bilgileri oluşturup bunları
`/etc/nikan-developer/install-result.env` dosyasına yazar. Şunlar için [`deploy/`](deploy/) klasörüne bakın:

- [Cloud-init user-data](deploy/cloud-init/) — herhangi bir bulutta etkileşimsiz kurulum (Hetzner/AWS/DO/Vultr/GCP/Azure/Oracle)
- [Hetzner Cloud notları](deploy/marketplace/hetzner/) — Hetzner üzerinde cloud-init tabanlı dağıtım

## Desteklenen Platformlar

**İşletim sistemleri:** Ubuntu, Debian, Armbian, Fedora, CentOS, RHEL, AlmaLinux, Rocky Linux, Oracle Linux, Amazon Linux, Virtuozzo, Arch, Manjaro, Parch, openSUSE (Tumbleweed / Leap), Alpine ve Windows.

**Mimariler:** `amd64` · `386` · `arm64` (aarch64) · `armv7` · `armv6` · `armv5` · `s390x`.

## Veritabanı Seçenekleri

Nikan.Developer kurulum sırasında seçilebilecek iki arka uç (backend) destekler:

- **SQLite** (varsayılan) — `/etc/nikan-developer/nikan-developer.db` konumunda tek bir dosya. Kurulum gerektirmez, küçük ve orta ölçekli dağıtımlar için idealdir.
- **PostgreSQL** — Yüksek kullanıcı sayıları veya çoklu düğüm (multi-node) kurulumları için önerilir. Yükleyici sizin için yerel olarak PostgreSQL kurabilir veya mevcut bir sunucuya DSN bağlantısı kabul edebilir.

Çalışma anında veritabanı türü ortam değişkenleri (environment variables) ile seçilir (yükleyici bunları sizin için `/etc/default/nikan-developer` dosyasına yazar):

```
NikanDeveloper_DB_TYPE=postgres
NikanDeveloper_DB_DSN=postgres://xui:password@127.0.0.1:5432/xui?sslmode=disable
```

### Mevcut bir SQLite Kurulumunu PostgreSQL'e Taşıma

```bash
nikan-developer migrate-db --dsn "postgres://xui:password@127.0.0.1:5432/xui?sslmode=disable"
# ardından /etc/default/nikan-developer içindeki NikanDeveloper_DB_TYPE ve NikanDeveloper_DB_DSN değerlerini ayarlayıp yeniden başlatın:
systemctl restart nikan-developer
```

Kaynak SQLite dosyasına dokunulmaz; yeni veritabanının düzgün çalıştığını doğruladıktan sonra eski SQLite dosyasını manuel olarak silebilirsiniz.

### Docker

Varsayılan `docker compose up -d` komutu SQLite kullanmaya devam eder. Birlikte paketlenmiş PostgreSQL servisi ile çalıştırmak için, `docker-compose.yml` dosyasındaki iki `NikanDeveloper_DB_*` değişken satırının yorumunu kaldırın ve profille başlatın:

```bash
docker compose --profile postgres up -d
```

Docker imajı, kullanıcı başına **IP limitlerini** zorunlu kılmak için Fail2ban ile (varsayılan olarak etkindir) paketlenmiştir. Fail2ban, ihlalcileri `iptables` ile engeller ve bunun için `NET_ADMIN` yetkisine ihtiyaç duyar. `docker-compose.yml` bunu zaten `cap_add` üzerinden vermektedir; ancak konteyneri bunun yerine `docker run` ile başlatırsanız bu yetkileri kendiniz eklemelisiniz, aksi takdirde yasaklamalar günlüğe kaydedilir ancak uygulanmaz:

```bash
docker run -d --cap-add=NET_ADMIN --cap-add=NET_RAW ... ghcr.io/nikandeveloper56/Nikan.Developer
```

## Ortam Değişkenleri (Environment Variables)

| Değişken | Açıklama | Varsayılan |
| --- | --- | --- |
| `NikanDeveloper_DB_TYPE` | Veritabanı türü: `sqlite` veya `postgres` | `sqlite` |
| `NikanDeveloper_DB_DSN` | PostgreSQL bağlantı dizesi (eğer `NikanDeveloper_DB_TYPE=postgres` ise) | — |
| `NikanDeveloper_DB_FOLDER` | SQLite veritabanı dizini | `/etc/nikan-developer` |
| `NikanDeveloper_DB_MAX_OPEN_CONNS` | Maksimum açık bağlantı sayısı (PostgreSQL havuzu) | — |
| `NikanDeveloper_DB_MAX_IDLE_CONNS` | Maksimum boşta bekleme bağlantısı (PostgreSQL havuzu) | — |
| `NikanDeveloper_INIT_WEB_BASE_PATH` | Web paneli için başlangıç URI yolu | `/` |
| `NikanDeveloper_ENABLE_FAIL2BAN` | Fail2ban tabanlı IP limit uygulamasını etkinleştir | `true` |
| `NikanDeveloper_LOG_LEVEL` | Günlük (Log) ayrıntı seviyesi (`debug`, `info`, `warning`, `error`) | `info` |
| `NikanDeveloper_DEBUG` | Hata ayıklama (debug) modunu etkinleştir | `false` |
| `NikanDeveloper_TUNNEL_HEALTH_MONITOR` | Tünel sağlık izleyicisini etkinleştir (bir URL'yi yoklar ve tekrarlanan başarısızlıklardan sonra xray'i yeniden başlatır; yeniden başlatma tüm istemcilerin bağlantısını düşürür) | `false` |
| `NikanDeveloper_TUNNEL_HEALTH_PROXY` | Yoklamanın gönderildiği proxy; yoklamanın tüneli test etmesi için bunu yerel bir xray gelen bağlantısına yönlendirin (ör. `socks5://127.0.0.1:1080`). Boş bırakılırsa yoklama yalnızca ana makine bağlantısını kontrol eder | — |
| `NikanDeveloper_TUNNEL_HEALTH_URL` | Tünel sağlığı için yoklanan URL | `https://www.cloudflare.com/cdn-cgi/trace` |
| `NikanDeveloper_TUNNEL_HEALTH_INTERVAL` | Yoklamalar arasındaki aralık | `30s` |
| `NikanDeveloper_TUNNEL_HEALTH_TIMEOUT` | Yoklama başına zaman aşımı | `10s` |
| `NikanDeveloper_TUNNEL_HEALTH_FAILURES` | Yeniden başlatma tetiklenmeden önceki ardışık başarısızlık sayısı | `3` |
| `NikanDeveloper_TUNNEL_HEALTH_COOLDOWN` | Ardışık yeniden başlatmalar arasındaki minimum gecikme | `5m` |

## Desteklenen Diller

Panel arayüzü 13 farklı dilde mevcuttur:

İngilizce · Farsça · Arapça · Çince (Basitleştirilmiş) · Çince (Geleneksel) · İspanyolca · Rusça · Ukraynaca · Türkçe · Vietnamca · Japonca · Endonezce · Portekizce (Brezilya)

## Katkıda Bulunma

Katkılarınızı her zaman bekliyoruz. Bir sorun (issue) açmadan veya pull request (PR) göndermeden önce lütfen [Katkıda Bulunma Kılavuzunu](/CONTRIBUTING.md) okuyun.

## Özel Teşekkürler

- [alireza0](https://github.com/alireza0/)

## Teşekkür & Atıf

- [Iran v2ray rules](https://github.com/chocolate4u/Iran-v2ray-rules) (Lisans: **GPL-3.0**): _Geliştirilmiş v2ray/xray ve v2ray/xray-clients yönlendirme (routing) kuralları; yerleşik İran alan adları ile güvenlik ve reklam engelleme odaklıdır._
- [Russia v2ray rules](https://github.com/runetfreedom/russia-v2ray-rules-dat) (Lisans: **GPL-3.0**): _Bu depo, Rusya'daki engellenen alan adları ve adreslere dayalı otomatik olarak güncellenen V2Ray yönlendirme kurallarını içerir._

## Topluluk Araçları

Nikan.Developer çevresindeki topluluk tarafından oluşturulmuş araçlar ve entegrasyonlar.

- [terraform-provider-Nikan.Developer](https://github.com/batonogov/terraform-provider-threexui) (Lisans: **MIT**): _Gelen bağlantılarnı, kullanıcıları, panel ayarlarını ve Xray yapılandırmasını Terraform / OpenTofu ile kod olarak (as code) yönetin._

## Projeyi Destekleyin

**Eğer bu proje size faydalı olduysa, bir yıldız verebilirsiniz**:star2:

<a href="https://www.buymeacoffee.com/NikanDeveloper56" target="_blank">
<img src="./media/default-yellow.png" alt="Bana Bir Kahve Ismarla" style="height: 70px !important;width: 277px !important;" >
</a>

</br>
<a href="https://nowpayments.io/donation/hsanaei" target="_blank" rel="noreferrer noopener">
   <img src="./media/donation-button-black.svg" alt="NOWPayments üzerinden Kripto Bağış Butonu">
</a>

## Yıldız Tablosu

[![Zaman içerisindeki yıldız sayısı](https://starchart.cc/NikanDeveloper56/Nikan.Developer.svg?variant=adaptive)](https://starchart.cc/NikanDeveloper56/Nikan.Developer)
