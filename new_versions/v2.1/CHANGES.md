# Minecraft Datapack Güncellemeleri

## Özet
Bu güncelleme, mevcut Minecraft datapack'ine hiçbir şeyi silmeden veya değiştirmeden sadece yeni özellikler ekler. Tüm değişiklikler `data/custom/function/permissions/` klasöründe yapılmıştır.

---

## 🔧 ADMIN YETKİLERİNE EKLENEN YENİ KOMUTLAR

### 1. **ap_fly** - Uçma Efekti
- **Açıklama**: Oyuncuya 10 saniye süreyle levitation efekti verir
- **Komut**: `/trigger ap_fly`
- **Dosya**: `data/custom/function/permissions/admin/tick.mcfunction` (Satır 81-82)

### 2. **ap_invis** - Görünmezlik
- **Açıklama**: Oyuncuya 60 saniye görünmezlik efekti verir
- **Komut**: `/trigger ap_invis`
- **Dosya**: `data/custom/function/permissions/admin/tick.mcfunction` (Satır 84-85)

### 3. **ap_night_vision** - Gece Görüşü
- **Açıklama**: Oyuncuya 5 dakika (300 saniye) gece görüşü efekti verir
- **Komut**: `/trigger ap_night_vision`
- **Dosya**: `data/custom/function/permissions/admin/tick.mcfunction` (Satır 87-88)

### 4. **ap_tp_spawn** - Spawn'a Işınlanma
- **Açıklama**: Oyuncuyu mevcut konumunun 100 blok yukarısına ışınlar
- **Komut**: `/trigger ap_tp_spawn`
- **Dosya**: `data/custom/function/permissions/admin/tick.mcfunction` (Satır 90-91)

### 5. **ap_give_diamond** - Elmas Ver
- **Açıklama**: Oyuncuya 64 adet elmas verir
- **Komut**: `/trigger ap_give_diamond`
- **Dosya**: `data/custom/function/permissions/admin/tick.mcfunction` (Satır 93-94)

### 6. **ap_kill_nearby** - Yakındaki Mobları Öldür
- **Açıklama**: Oyuncunun etrafındaki 20 blok mesafedeki tüm mobları öldürür (oyuncular hariç)
- **Komut**: `/trigger ap_kill_nearby`
- **Dosya**: `data/custom/function/permissions/admin/tick.mcfunction` (Satır 96-97)

### 7. **ap_lightning** - Şimşek Çağır
- **Açıklama**: Oyuncunun bulunduğu konuma şimşek düşürür
- **Komut**: `/trigger ap_lightning`
- **Dosya**: `data/custom/function/permissions/admin/tick.mcfunction` (Satır 99-100)

### 8. **ap_firework** - Havai Fişek
- **Açıklama**: Oyuncunun 2 blok üstünde renkli bir havai fişek patlatır
- **Komut**: `/trigger ap_firework`
- **Dosya**: `data/custom/function/permissions/admin/tick.mcfunction` (Satır 102-103)

### 9. **ap_xp_boost** - XP Artırma
- **Açıklama**: Oyuncuya 1000 puan deneyim puanı verir
- **Komut**: `/trigger ap_xp_boost`
- **Dosya**: `data/custom/function/permissions/admin/tick.mcfunction` (Satır 105-106)

### 10. **ap_hunger_fill** - Açlık Doldur
- **Açıklama**: Oyuncunun açlık barını anında doldurur
- **Komut**: `/trigger ap_hunger_fill`
- **Dosya**: `data/custom/function/permissions/admin/tick.mcfunction` (Satır 108-109)

---

## 👑 OWNER YETKİLERİNE EKLENEN YENİ KOMUTLAR

### 1. **ap_op_all** - Herkese OP Ver
- **Açıklama**: Sunucudaki tüm oyunculara "op" etiketi ekler
- **Komut**: `/trigger ap_op_all`
- **Dosya**: `data/custom/function/permissions/owner/tick.mcfunction` (Satır 20-21)

### 2. **ap_deop_all** - Herkesten OP Al
- **Açıklama**: Sunucudaki tüm oyunculardan "op" etiketini kaldırır
- **Komut**: `/trigger ap_deop_all`
- **Dosya**: `data/custom/function/permissions/owner/tick.mcfunction` (Satır 23-24)

### 3. **ap_creative_all** - Herkesi Creative Yap
- **Açıklama**: Sunucudaki tüm oyuncuları creative moda alır
- **Komut**: `/trigger ap_creative_all`
- **Dosya**: `data/custom/function/permissions/owner/tick.mcfunction` (Satır 26-27)

### 4. **ap_heal_all** - Herkesi İyileştir
- **Açıklama**: Sunucudaki tüm oyunculara anında iyileşme efekti verir
- **Komut**: `/trigger ap_heal_all`
- **Dosya**: `data/custom/function/permissions/owner/tick.mcfunction` (Satır 29-30)

### 5. **ap_clear_all** - Herkesin Envanterini Temizle
- **Açıklama**: Sunucudaki tüm oyuncuların envanterini temizler
- **Komut**: `/trigger ap_clear_all`
- **Dosya**: `data/custom/function/permissions/owner/tick.mcfunction` (Satır 32-33)

### 6. **ap_god_mode** - Tanrı Modu
- **Açıklama**: Oyuncuya neredeyse sonsuz süre (999999 saniye) direnç efekti verir
- **Komut**: `/trigger ap_god_mode`
- **Dosya**: `data/custom/function/permissions/owner/tick.mcfunction` (Satır 35-36)

### 7. **ap_super_speed** - Süper Hız
- **Açıklama**: Oyuncuya 60 saniye süreyle çok güçlü (seviye 10) hız efekti verir
- **Komut**: `/trigger ap_super_speed`
- **Dosya**: `data/custom/function/permissions/owner/tick.mcfunction` (Satır 38-39)

### 8. **ap_explode** - Patlama
- **Açıklama**: Oyuncunun 1 blok üstünde bir TNT spawlar
- **Komut**: `/trigger ap_explode`
- **Dosya**: `data/custom/function/permissions/owner/tick.mcfunction` (Satır 41-42)

### 9. **ap_tp_all** - Herkesi Yanına Getir
- **Açıklama**: Sunucudaki tüm oyuncuları komutu kullanan oyuncunun yanına ışınlar
- **Komut**: `/trigger ap_tp_all`
- **Dosya**: `data/custom/function/permissions/owner/tick.mcfunction` (Satır 44-45)

### 10. **ap_reset_world** - Dünyayı Sıfırla
- **Açıklama**: custom:reset_world fonksiyonunu çalıştırır (dikkatli kullanılmalı!)
- **Komut**: `/trigger ap_reset_world`
- **Dosya**: `data/custom/function/permissions/owner/tick.mcfunction` (Satır 47-48)

---

## 📝 DEĞİŞTİRİLEN DOSYALAR

### 1. `data/custom/function/permissions/admin/tick.mcfunction`
- **Değişiklik**: Dosyanın sonuna 10 yeni komut eklendi (satır 81-109)
- **Önceki içerik**: Korundu, hiçbir şey silinmedi

### 2. `data/custom/function/permissions/owner/tick.mcfunction`
- **Değişiklik**: Dosyanın sonuna 10 yeni komut eklendi (satır 20-48)
- **Önceki içerik**: Korundu, hiçbir şey silinmedi

### 3. `data/custom/function/permissions/enable_admin_triggers.mcfunction`
- **Değişiklik**: Dosyanın sonuna 10 yeni trigger enable komutu eklendi
- **Önceki içerik**: Korundu, hiçbir şey silinmedi
- **Eklenen satırlar**:
  - ap_fly, ap_invis, ap_night_vision, ap_tp_spawn
  - ap_give_diamond, ap_kill_nearby, ap_lightning, ap_firework
  - ap_xp_boost, ap_hunger_fill

### 4. `data/custom/function/permissions/enable_owner_triggers.mcfunction`
- **Değişiklik**: Dosyanın sonuna 10 yeni trigger enable komutu eklendi
- **Önceki içerik**: Korundu, hiçbir şey silinmedi
- **Eklenen satırlar**:
  - ap_op_all, ap_deop_all, ap_creative_all, ap_heal_all
  - ap_clear_all, ap_god_mode, ap_super_speed, ap_explode
  - ap_tp_all, ap_reset_world

### 5. `data/custom_admin/function/load.mcfunction`
- **Değişiklik**: Yeni scoreboard objectives eklendi
- **Önceki içerik**: Korundu, hiçbir şey silinmedi
- **Eklenen Admin Scoreboards** (satır 60-69):
  - ap_fly, ap_invis, ap_night_vision, ap_tp_spawn
  - ap_give_diamond, ap_kill_nearby, ap_lightning, ap_firework
  - ap_xp_boost, ap_hunger_fill
- **Eklenen Owner Scoreboards** (satır 29-38):
  - ap_op_all, ap_deop_all, ap_creative_all, ap_heal_all
  - ap_clear_all, ap_god_mode, ap_super_speed, ap_explode
  - ap_tp_all, ap_reset_world

---

## 🎮 KULLANIM TALİMATLARI

### Admin Yetkileri İçin:
1. Oyuncunun `op` etiketi olmalı
2. Komutlar otomatik olarak etkinleştirilir
3. Komut kullanmak için: `/trigger <komut_adı>`

Örnek:
```
/trigger ap_fly
/trigger ap_lightning
/trigger ap_give_diamond
```

### Owner Yetkileri İçin:
1. Oyuncunun `Owner` etiketi olmalı
2. Komutlar otomatik olarak etkinleştirilir
3. Komut kullanmak için: `/trigger <komut_adı>`

Örnek:
```
/trigger ap_god_mode
/trigger ap_tp_all
/trigger ap_heal_all
```

---

## ⚠️ ÖNEMLİ NOTLAR

1. **Hiçbir mevcut özellik silinmedi veya değiştirilmedi**
2. Tüm yeni özellikler mevcut sistem ile uyumludur
3. Yeni komutlar mevcut yetki sistemi ile entegre çalışır
4. `ap_reset_world` komutu tehlikeli olabilir - dikkatli kullanın
5. Tüm scoreboardlar load.mcfunction dosyasında tanımlanmıştır
6. Triggers otomatik olarak enable_admin_triggers ve enable_owner_triggers ile etkinleştirilir

---

## 🔄 KURULUM

1. Eski datapack'inizi yedekleyin
2. Güncellenmiş `MC-ServerToolkit-PP-Updated.zip` dosyasını `datapacks` klasörüne koyun
3. Minecraft'ta `/reload` komutunu çalıştırın
4. Yeni komutlar kullanıma hazır!

---

## 📊 İSTATİSTİKLER

- **Toplam Yeni Admin Komutu**: 10
- **Toplam Yeni Owner Komutu**: 10
- **Değiştirilen Dosya Sayısı**: 5
- **Eklenen Kod Satırı**: ~100+
- **Silinen Kod Satırı**: 0

---

## ✅ TEST ÖNERİLERİ

Her yeni özelliği test etmek için:

1. Test dünyası oluşturun
2. Kendinize admin veya owner yetkisi verin:
   ```
   /tag @s add op
   /tag @s add Owner
   ```
3. Her komutu sırayla test edin
4. Beklenmedik davranış olup olmadığını kontrol edin

---

**Güncelleme Tarihi**: 27 Ocak 2026  
**Sürüm**: 1.1 (Yeni Özellikler Eklendi)
