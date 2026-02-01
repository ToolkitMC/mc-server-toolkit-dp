# 🎮 Geliştirilmiş Minecraft Datapack v2.0

## 📦 Paket İçeriği

Bu paket, Minecraft datapack'iniz için tamamen yenilenmiş bir izin sistemi içerir:

### 📁 Dosyalar
1. **datapack.zip** - Geliştirilmiş datapack (187 KB)
2. **PERMISSIONS_GUIDE.md** - Tam dokümantasyon (8 KB)
3. **QUICK_START.md** - Hızlı başlangıç rehberi (4.8 KB)
4. **CHANGELOG.md** - Detaylı değişiklik listesi (5.7 KB)

### 📥 İndirme Linki
**Google Drive**: [v2.3/datapack/](https://drive.google.com/drive/folders/1oJgBP-2PfJ7fsLvUNB-3dNx1ZdE13lqw?usp=sharing)

---

## ⚡ Hızlı Kurulum

### 1. ZIP'i İndir ve Yükle
```
1. Google Drive'dan datapack.zip indir
2. .minecraft/saves/DUNYA_ADI/datapacks/ klasörüne kopyala
3. Oyunda /reload yaz
```

### 2. İlk İzin Ver
```mcfunction
/function custom:permissions/owner/init {Player:"SenınAdın"}
```

### 3. Test Et
```mcfunction
/scoreboard players set @s ap_god_mode 1
```

---

## ✨ Ana Özellikler

### 👑 Owner (Sahip) İzinleri - 24 Trigger
- **Gamemode Kontrolü**: Kendini ve herkesi değiştir
- **XP Yönetimi**: 100 XP veya 10000 level ekle
- **Entity Yönetimi**: Mob ve item temizleme
- **İzin Kontrolü**: OP ver/al
- **Efektler**: Tanrı modu, süper hız, süper zıplama
- **Eğlence**: TNT, Nuke
- **Dünya Yönetimi**: Spawn ayarla, chunk temizle
- **Debug**: Sistem bilgileri

### ⚔️ Admin İzinleri - 45 Trigger
- **Hava Kontrolü**: Temiz, yağmur, fırtına
- **Zaman Kontrolü**: Gündüz, gece, öğle, gece yarısı
- **Kişisel Bakım**: İyileşme, açlık doldurma
- **Eşyalar**: Elmas, zümrüt, netherite, araçlar
- **Efektler**: 10+ farklı efekt
- **Teleportasyon**: Spawn'a ışınlanma
- **Menüler**: 6+ farklı menü
- **Builder Araçları**: Alan doldurma, fill
- **Admin Araçları**: Ban, log, yardım

---

## 🎯 Popüler Komutlar

### Owner
```mcfunction
# Tanrı modu
/scoreboard players set @s ap_god_mode 1

# 10000 level
/scoreboard players set @s ap_max_xp 1

# Nuke!
/scoreboard players set @s ap_nuke 1
```

### Admin
```mcfunction
# 64 elmas
/scoreboard players set @s ap_give_diamond 1

# Gece görüşü
/scoreboard players set @s ap_night_vision 1

# Havayı temizle
/scoreboard players set @s ap_clear_weather 1
```

---

## 📊 Önceki Versiyondan Farklar

| Özellik | Önceki | Yeni |
|---------|--------|------|
| Owner Trigger | 15 | 24 (+60%) |
| Admin Trigger | 28 | 45 (+60%) |
| Kategoriler | ❌ | ✅ 15 kategori |
| Tag Kontrolü | Kısmi | Tam ✅ |
| Mesajlar | Basit | Detaylı ✅ |
| Performans | İyi | Daha İyi ✅ |

---

## 🆕 Yeni Eklenenler

### Owner için YENİ (9 adet)
- ✨ Maksimum XP (10000 level)
- ✨ Item temizleme
- ✨ Süper zıplama
- ✨ Nuke (5 TNT)
- ✨ Herkesi survival yap
- ✨ Spawn ayarla
- ✨ Chunk temizle
- ✨ Debug modu
- ✨ God mode'a regeneration eklendi

### Admin için YENİ (17 adet)
- ✨ Fırtına başlat
- ✨ Öğle/Gece yarısı
- ✨ Zümrüt ver
- ✨ Netherite ver
- ✨ Su altı nefesi
- ✨ Ateş direnci
- ✨ Donmayı çöz
- Ve daha fazlası...

---

## 📖 Dokümantasyon

### Detaylı Bilgi İçin
1. **PERMISSIONS_GUIDE.md** - Tüm trigger'ların listesi ve açıklamaları
2. **QUICK_START.md** - Hızlı başlangıç ve ipuçları
3. **CHANGELOG.md** - Tüm değişikliklerin detaylı listesi

### Oyun İçi Yardım
```mcfunction
/scoreboard players set @s ap_help 1
```

---

## ⚙️ Teknik Detaylar

### Uyumluluk
- **Minecraft Versiyonu**: 1.21+ (pack_format 94)
- **Desteklenen Formatlar**: 81-95
- **Platform**: Java Edition

### Özellikler
- Tag bazlı güvenlik sistemi
- Trigger scoreboard'ları
- JSON mesajlaşma
- Kategorize edilmiş kod yapısı
- Performans optimizasyonları

---

## 🛠️ Kurulum Detayları

### Klasör Yapısı
```
datapacks/
└── datapack_improved.zip (veya extract edilmiş)
    ├── pack.mcmeta
    ├── data/
    │   ├── custom/
    │   │   └── function/
    │   │       └── permissions/
    │   │           ├── owner/
    │   │           │   ├── tick.mcfunction (YENİ)
    │   │           │   └── init.mcfunction (YENİ)
    │   │           └── admin/
    │   │               ├── tick.mcfunction (YENİ)
    │   │               └── init.mcfunction (YENİ)
    │   └── [diğer namespace'ler]
    └── addons/
```

### İlk Yükleme
1. ZIP'i datapacks klasörüne koy
2. `/reload` yap
3. Owner ver: `/function custom:permissions/owner/init {Player:"Ad"}`
4. Admin ver: `/function custom:permissions/admin/init {Player:"Ad"}`

### Güncelleme
1. Eski datapack'i yedekle
2. Yeni ZIP'i kopyala
3. `/reload` yap
4. İzinleri yenile (yukarıdaki komutlar)

---

## ⚠️ Önemli Notlar

### Güvenlik
- Owner yetkisini sadece güvenilir kişilere verin
- Admin yetkisi daha sınırlıdır ama yine de dikkatli olun
- Tag sistemi otomatik kontrol yapar

### Performans
- Aynı anda çok fazla trigger kullanmayın
- Büyük işlemlerden önce dünyayı yedekleyin
- `ap_reset_world` gibi tehlikeli komutları dikkatli kullanın

### Yedekleme
- Her önemli değişiklikten önce dünya yedeği alın
- Özellikle `ap_clear_chunks` ve `ap_nuke` kullanırken

---

## 🐛 Sorun Giderme

### Komut Çalışmıyor
```mcfunction
1. /reload
2. /tag @s list (kontrolü)
3. /scoreboard players enable @s [trigger]
4. /trigger [trigger] set [x]
```

### İzinler Kayboldu
```mcfunction
/function custom:permissions/owner/init {Player:"Adın"}
```

### Debug Modu
```mcfunction
/trigger ap_debug set 1
```

---

## 📊 İstatistikler

- **Toplam Özellik**: 69
- **Kod Satırı**: 500+
- **Kategori**: 15
- **Dosya Boyutu**: 187 KB

---

## 🎓 Öğrenme Kaynakları

### Yeni Başlayanlar
1. QUICK_START.md'yi okuyun
2. Basit komutlarla başlayın (`ap_creative`, `ap_heal_self`)
3. Test dünyasında pratik yapın

### İleri Seviye
1. PERMISSIONS_GUIDE.md'de tüm özellikleri inceleyin
2. Makrolar ve otomasyonlar oluşturun
3. Custom menüler tasarlayın

---

## 🚀 Gelecek Güncellemeler

### v2.1 Planları
- GUI tabanlı izin paneli
- Ekonomi sistemi entegrasyonu
- Daha fazla particle efekti
- Gelişmiş warp sistemi
- Custom achievement'lar

---

## 📞 Destek & Geri Bildirim

### Yardım
- Discord sunucumuz
- GitHub issues
- Forum thread'i

### Geri Bildirim
Lütfen deneyimlerinizi paylaşın:
- Hangi özellikler en kullanışlı?
- Ne gibi yeni özellikler istersiniz?
- Bulduğunuz bug'lar?

---

## 📜 Lisans

Bu datapack orijinal VanillaControl by Legends11 üzerine geliştirilmiştir.

---

## 🎉 Teşekkürler

Bu paketi indirdiğiniz için teşekkürler! Keyifli oyunlar!

**v2.0 - Şubat 2026**

---

## 📱 Hızlı Linkler

- [Ana Dokümantasyon](PERMISSIONS_GUIDE.md)
- [Hızlı Başlangıç](QUICK_START.md)
- [Değişiklikler](CHANGELOG.md)

**Başarılar! 🎮**
