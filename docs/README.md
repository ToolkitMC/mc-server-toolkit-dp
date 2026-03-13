# 🧰 MC-ServerToolkit-PP v2.0

> ⚠️ Bu proje artık aktif olarak geliştirilmemektedir.
---
> Güncel proje: [tickwarden/Gulce_AdminPower](https://github.com/tickwarden/Gulce_AdminPower)

---
> **Performans odaklı, vanilla tabanlı sunucu yönetim datapack’i**

MC-ServerToolkit++, Minecraft Java Edition sunucuları için geliştirilen; **yönetim araçları**, **menü sistemleri** ve **genişletilebilir yardımcı modüller** sunan özel bir **vanilla datapack** projesidir. Genel oyuncu kullanımı için değil, **yetkili / teknik kullanım** için tasarlanmıştır.

---

## 📦 Genel Bilgiler

* **Proje Türü:** Vanilla Datapack
* **Hedef:** Sunucu yönetimi & teknik araçlar
* **Minecraft:** `1.21.7+`
* **Lisans:** MIT
* **Durum:** **Production Ready** ✅ (bazı modüller beta)

> ⚙️ **Performans felsefesi:** Sistemler gereksiz tick yükü oluşturmadan, mümkün olduğunca **event-based** ve **schedule kontrollü** çalışır. Tick-safe mimari önceliklidir.

---

## ✨ Öne Çıkan Özellikler

* Performans odaklı mimari (optimize tick & schedule)
* Tamamen **vanilla** (mod gerekmez)
* Sunucu dostu — düşük TPS etkisi
* Genişletilebilir yapı (addon / modül mantığı)
* Güvenlik öncelikli yönetim araçları
* Okunabilir ve ayrık fonksiyon yapısı

---

## 🧭 Menü ve Yönetim Sistemleri

### 🔐 İzin & Yönetim Menüsü

```mcfunction
/function glc_menu:open/menu {ui:1}
```

Admin eylem menüsü:

```mcfunction
/function actions:menu/open
```

---

## 🧩 Çoklu Komut Sistemi

```mcfunction
/function multicommand:add {command:"<Komut>"}
/function multicommand:run_all
/function multicommand:clear
```

---

## 🛠️ Özel Yönetim Araçları

```mcfunction

/function custom:tools/godarmor {"target":"x"}

/function admin:commands/sethome {id:"x"}
/function admin:commands/home {id:"x"}
/dialog show @s command_alias:menu
/function scheduler:add {time:<time>,command:"<command>",player:"<targets>"}
/function player_tracker:detailed_stats {player:"x"}
/function global:admin_tools
/function gss_security:gui/main_menu
/function gss_security:anti_xray/scan

/function custom:tools/kick/menu
```

---

## 🪧 Hologram Sistemi

```mcfunction
/function custom:tools/hologram {x:"<x>",y:"<y>",z:"<z>",text:<JSON>}
```

---

## 🔑 İzin Sistemi (Deneysel)

```mcfunction
/function custom:permissions/<rol>/init {Player:"@s"}
```

---

## 🚫 Kritik Komutlar – Silinmesi Yasak

* `/function custom:diamond`
* `/function custom:set_day`
* `/function custom:weather_clear`

---

## ❓ Sık Sorulan Sorular (Özet)

* **Demo sürümü desteklenmez.** Demo; `/function`, macro, storage ve yetkileri kısıtlar.
* **Tick-safe mi?** Evet. Event-based ve schedule kontrollüdür.
* **Tek oyunculu çalışır mı?** Tam sürüm Java Edition’da evet; ancak yönetim odaklıdır.

---

# 🎯 Schedule Sistemi – Uygulama Rehberi

> ℹ️ **Bu bölüm eski sürümlerden (v1.x) v2.0’a geçenler içindir.** Yeni kurulumlarda manuel işlem gerekmez.

## 📋 Değişen Dosyalar

1. `data/main/function/loop/init.mcfunction` → `main_loop_init.mcfunction`
2. `data/main/function/load.mcfunction` → `main_load.mcfunction`
3. `data/main/function/stop.mcfunction` → `main_stop.mcfunction`
4. `data/main/function/init_globals.mcfunction` → `init_globals.mcfunction`
5. `data/custom_admin/function/handler/loop/all/1.mcfunction` → `custom_admin_loop.mcfunction`
6. `data/global/function/tick.mcfunction` → `global_tick.mcfunction`
7. `data/gulce_adminpower_addons/function/loop.mcfunction` → `addons_loop.mcfunction`

---

## 🔧 Kurulum (Eski Sürümler)

```bash
cp -r datapack datapack_backup_$(date +%Y%m%d)
```

```mcfunction
/reload
/function main:load
```

---

## 📊 Performans Kazancı (Özet)

* **Önce:** ~120 çağrı/sn
* **Sonra:** ~81 çağrı/sn
* **Kazanç:** **%32.5** daha az yük

---

## 📞 Destek

* `/datapack list`
* `/scoreboard players list global`
* `/reload`
* Gerekirse orijinal dosyaları geri yükle

---

**Son Güncelleme:** 2026-01-27
**Sürüm:** v2.0
