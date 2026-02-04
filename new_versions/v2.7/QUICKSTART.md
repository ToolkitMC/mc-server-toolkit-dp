# 🚀 Hızlı Başlangıç Kılavuzu

## 5 Dakikada Kurulum

### 1️⃣ İndir (2 dosya gerekli)

**Bookshelf (Zorunlu):**
```
https://modrinth.com/datapack/bookshelf-dev/version/v3.2.2-1.21
```

**Bu Datapack:**
```
gulceos-v2_4-enhanced-with-bookshelf.zip
```

---

### 2️⃣ Yükle

```
world/
  └── datapacks/
      ├── bookshelf-dev-1_21_11-v3_2_2.zip    ← ÖNCE BU
      └── gulceos-v2_4-enhanced.zip          ← SONRA BU
```

⚠️ **Sıralama Önemli!** Bookshelf önce yüklenmelidir.

---

### 3️⃣ Aktifleştir

Oyuna gir ve şu komutları çalıştır:

```mcfunction
/reload
/gamerule commandBlocksWork true
/gamerule sendCommandFeedback true
/function main:load
```

---

### 4️⃣ Test Et

```mcfunction
/trigger gss.trigger
```

✅ Eğer renkli bir menü açıldıysa, başarılı! 🎉

---

## 🎮 İlk Adımlar

### Log Görüntüleme Yetkisi Ver

Admin'lere log görme yetkisi:
```mcfunction
/tag @s add gss_security.log._.info
```

### Admin Vision'ı Dene

```mcfunction
/function gss_security:admin_vision/toggle
```

Duvarlara bakın - particle'lar görünüyor mu? ✨

### İstatistiklere Bak

```mcfunction
/function gss_security:gui/stats
```

---

## ❓ Sorun mu Var?

### "Function not found" Hatası

✅ Bookshelf yüklenmiş mi kontrol et:
```mcfunction
/datapack list
```

"Bookshelf" listede görünmeli.

### Loglar Çalışmıyor

✅ Gamerule'ları tekrar kontrol et:
```mcfunction
/gamerule commandBlocksWork true
```

### Yetki Hataları

✅ Oyuncuya admin tag'i ver:
```mcfunction
/tag @s add gulceos_permissions_admin
```

---

## 📚 Daha Fazla Bilgi

Detaylı dokümantasyon için `README.md` dosyasına bakın.

---

**Kolay gelsin! 🛡️**
