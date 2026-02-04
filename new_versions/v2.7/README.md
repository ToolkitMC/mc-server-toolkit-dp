# 🛡️ GulceOS VanillaControl v2.4 + GSS Security Suite

**Enhanced Edition with Bookshelf Integration**

---

## 📦 Nedir?

Bu, **GulceOS VanillaControl** datapack'inin **Bookshelf v3.2+** kütüphanesi ile geliştirilmiş versiyonudur. Gelişmiş güvenlik, anti-cheat ve admin araçları içerir.

### ✨ Yeni Özellikler (GSS Security Suite)

#### 🔍 Anti-Xray Sistemi
- **Raycast Tabanlı Tespit**: Bookshelf'in DDA algoritması ile oyuncuların baktığı blokları analiz eder
- **Otomatik Şüpheli Oyuncu Tespiti**: Cevherlere anormal bakış tespiti
- **Skor Sistemi**: Her oyuncu için şüphe skoru takibi
- **Admin Bildirimleri**: Gerçek zamanlı uyarılar ve loglar

#### 👁️ Admin Vision Tool
- **Duvar Arkası Görüş**: Piercing raycast ile duvarların arkasını görme
- **Entity Tespiti**: Oyuncuları ve entity'leri duvarların arkasında tespit etme
- **Particle Göstergeler**: Görsel feedback ile hedef takibi
- **Toggle Sistemi**: `/trigger gss.trigger` ile açma/kapama

#### 📊 Professional Logging (Bookshelf Log Modülü)
- **Renkli ve Zaman Damgalı Loglar**: Her güvenlik olayı kaydedilir
- **Severity Seviyeleri**: Debug, Info, Warn, Error
- **Log Geçmişi**: Tüm olayları görüntüleme
- **Özelleştirilebilir Format**: Türkçe destekli log formatları

#### 🛡️ Protected Zones (Planlanan)
- Koruma alanları oluşturma
- Raycast ile sınır kontrolü
- Dinamik zone yönetimi

---

## 🚀 Kurulum

### Gereksinimler

1. **Minecraft 1.21+** (Pack format 48+)
2. **Bookshelf v3.2.0 veya üzeri** ⚠️ ÖNEMLİ!

### Adımlar

#### 1. Bookshelf'i İndir
```
https://modrinth.com/datapack/bookshelf-dev/versions
```
- En son **1.21** uyumlu versiyonu seç
- `bookshelf-dev-1_21_11-v3_2_2.zip` veya daha yeni

#### 2. World Klasörüne Yükle
```
world/
  ├── datapacks/
  │   ├── bookshelf-dev-1_21_11-v3_2_2.zip  ← Önce Bookshelf
  │   └── gulceos-v2_4-enhanced.zip         ← Sonra bu datapack
```

#### 3. Oyunda Aktifleştir
```mcfunction
/reload
/function main:load
```

#### 4. Gamerulelari Ayarla (Önemli!)
```mcfunction
/gamerule commandBlocksWork true
/gamerule sendCommandFeedback true
```
*Bookshelf'in log modülü için gerekli*

---

## 🎮 Kullanım

### Ana Menü
```mcfunction
/trigger gss.trigger
```

### Hızlı Komutlar

#### Admin Vision Aç/Kapat
```mcfunction
/function gss_security:admin_vision/toggle
```

#### İstatistikleri Gör
```mcfunction
/function gss_security:gui/stats
```

#### Log Geçmişini Görüntüle
```mcfunction
/function #bs.log:history
```

#### Config Değerlerini Gör (Bookshelf Dump)
```mcfunction
/function #bs.dump:var {var:"storage gss:config settings"}
```

---

## ⚙️ Yapılandırma

### Config Storage
```mcfunction
data modify storage gss:config settings merge value {
  anti_xray: {
    enabled: 1b,
    max_score: 100,
    scan_radius: 50.0d,
    suspicious_threshold: 75,
    auto_freeze: 0b
  },
  admin_vision: {
    enabled: 1b,
    max_distance: 100.0d,
    show_entities: 1b,
    particle_type: "end_rod"
  },
  logging: {
    enabled: 1b,
    auto_save: 1b,
    max_history: 100
  }
}
```

### Log Görüntüleme Yetkileri

Her admin'e log görme yetkisi vermek için:
```mcfunction
# Info level ve üstü (warn, error)
/tag @p add gss_security.log._.info

# Debug level (her şeyi göster)
/tag @p add gss_security.log._.debug

# Sadece anti-xray logları
/tag @p add gss_security.log.anti_xray.warn
```

---

## 📚 Bookshelf Entegrasyonu

### Kullanılan Modüller

#### 1. bs.raycast
```mcfunction
# Anti-Xray için
function #bs.raycast:run {
  with: {
    max_distance: 50.0,
    blocks: true,
    on_targeted_block: "function gss_security:anti_xray/check_ore"
  }
}
```

#### 2. bs.log
```mcfunction
# Güvenlik olaylarını logla
function #bs.log:warn {
  namespace: "gss_security",
  path: "gss_security:anti_xray/suspicious_detected",
  tag: "anti_xray",
  message: '"Şüpheli davranış tespit edildi!"'
}
```

#### 3. bs.dump
```mcfunction
# Debug için değişkenleri göster
function #bs.dump:var {
  var: {
    config: "storage gss:config settings",
    xray_data: "storage gss:anti_xray data"
  }
}
```

---

## 🔧 Teknik Detaylar

### Performans
- **Anti-Xray Scan**: Her 2 saniyede bir (40 tick)
- **Admin Vision**: Her tick (sadece aktif admin'ler için)
- **TPS Korumalı**: Scheduled tick sistemi ile

### Scoreboard'lar
```
gss.xray        - X-Ray şüphe skoru
gss.vision      - Admin vision toggle (0=kapalı, 1=açık)
gss.stats       - İç hesaplamalar
gss.trigger     - Menu açma trigger
```

### Storage Namespace'leri
```
gss:config      - Ana konfigürasyon
gss:anti_xray   - Anti-xray verileri
gss:zones       - Protected zone verileri
gss:temp        - Geçici veriler
```

---

## 🐛 Sorun Giderme

### "Bookshelf bulunamadı" Hatası
✅ Bookshelf'in doğru yüklendiğinden emin olun:
```mcfunction
/reload
/function #bs.load:status
```

### Log'lar Görünmüyor
✅ Gamerule'ları kontrol edin:
```mcfunction
/gamerule commandBlocksWork true
/gamerule sendCommandFeedback true
```

✅ Log görüntüleme yetkisi verin:
```mcfunction
/tag @s add gss_security.log._.info
```

### Raycast Çalışmıyor
✅ Bookshelf versiyonunu kontrol edin (v3.2+ gerekli)
✅ Admin yetkisi olduğundan emin olun

---

## 📜 Lisans

Bu datapack **GulceOS VanillaControl** ve **Bookshelf** projelerinin üzerine inşa edilmiştir.

- **GulceOS VanillaControl**: by Legends11
- **Bookshelf**: https://github.com/Gunivers/Bookshelf
- **GSS Security Suite**: by Claude (Anthropic)

---

## 🙏 Credits

- **Legends11** - Orijinal GulceOS VanillaControl
- **Gunivers Team** - Bookshelf library
- **Aksiome, theogiraudet** - Bookshelf katkıları
- **Community** - Test ve feedback

---

## 🔗 Linkler

- **Bookshelf Docs**: https://docs.mcbookshelf.dev
- **Bookshelf Download**: https://modrinth.com/datapack/bookshelf-dev
- **GulceOS Discord**: [Varsa ekleyin]

---

**Enjoy the enhanced security! 🛡️**
