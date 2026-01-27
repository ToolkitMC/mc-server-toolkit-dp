# 🎯 SCHEDULE SİSTEMİ - UYGULAMA REHBERİ

## 📋 DEĞİŞEN DOSYALAR

### 1. `data/main/function/loop/init.mcfunction`
**Değişiklik:** Schedule'lanmış sistemler artık buradan çağrılmıyor
**Dosya:** `main_loop_init.mcfunction`

### 2. `data/main/function/load.mcfunction`
**Değişiklik:** Schedule başlatma kodları eklendi
**Dosya:** `main_load.mcfunction`

### 3. `data/main/function/stop.mcfunction`
**Değişiklik:** Schedule temizliği genişletildi
**Dosya:** `main_stop.mcfunction`

### 4. `data/main/function/init_globals.mcfunction`
**Değişiklik:** Açıklama notları eklendi
**Dosya:** `init_globals.mcfunction`

### 5. `data/custom_admin/function/handler/loop/all/1.mcfunction`
**Değişiklik:** Self-reschedule eklendi + guard kontrolü
**Dosya:** `custom_admin_loop.mcfunction`

### 6. `data/global/function/tick.mcfunction`
**Değişiklik:** Self-reschedule eklendi + guard kontrolü + entity filter
**Dosya:** `global_tick.mcfunction`

### 7. `data/gulce_adminpower_addons/function/loop.mcfunction`
**Değişiklik:** Self-reschedule eklendi + guard kontrolü
**Dosya:** `addons_loop.mcfunction`

---

## 🔧 KURULUM ADIMLARI

### Adım 1: Yedek Al
```bash
# Datapack klasörünü yedekle
cp -r datapack datapack_backup_$(date +%Y%m%d)
```

### Adım 2: Dosyaları Değiştir

```bash
# Main loop init
cp main_loop_init.mcfunction datapack/data/main/function/loop/init.mcfunction

# Main load
cp main_load.mcfunction datapack/data/main/function/load.mcfunction

# Main stop
cp main_stop.mcfunction datapack/data/main/function/stop.mcfunction

# Init globals
cp init_globals.mcfunction datapack/data/main/function/init_globals.mcfunction

# Custom admin loop
cp custom_admin_loop.mcfunction datapack/data/custom_admin/function/handler/loop/all/1.mcfunction

# Global tick
cp global_tick.mcfunction datapack/data/global/function/tick.mcfunction

# Addons loop
cp addons_loop.mcfunction datapack/data/gulce_adminpower_addons/function/loop.mcfunction
```

### Adım 3: Test Et

```mcfunction
# Minecraft'ta
/reload

# Sistemi başlat (eğer otomatik başlamıyorsa)
/function main:load
```

---

## 📊 SCHEDULE AYARLARI

| Sistem | Önceki | Yeni | Açıklama |
|--------|--------|------|----------|
| `main:loop/init` | Her tick | Her tick | Kritik - değişmedi |
| `glc_menu:handler/tick` | Her tick | Her tick | GUI - değişmedi |
| `cooldown:loop` | Her tick | Her tick | Cooldown - değişmedi |
| `custom_admin:handler/loop/all/1` | Her tick | **2 tick** | %50 azalma |
| `global:tick` | Her tick | **3 tick** | %66 azalma |
| `gulce_adminpower_addons:loop` | Her tick | **5 tick** | %80 azalma |

**Toplam Hesaplama:**
- **Önceki:** 6 sistem × 20 TPS = 120 çağrı/saniye
- **Yeni:** 3 sistem × 20 TPS + 3 sistem × (10+6.7+4) TPS = 60 + 20.7 = **~81 çağrı/saniye**
- **Kazanç:** %32.5 azalma

---

## ⚙️ SİSTEMİ AÇMA/KAPATMA

### Manuel Aktivasyon

```mcfunction
# Admin loop'u aç
/scoreboard players set #admin_loop global 1
/schedule function custom_admin:handler/loop/all/1 2t replace

# Global tick'i aç
/scoreboard players set #global_tick global 1
/schedule function global:tick 3t replace

# Addons'u aç
/scoreboard players set #main global 1
/schedule function gulce_adminpower_addons:loop 5t replace
```

### Manuel Kapatma

```mcfunction
# Sistemi kapat (schedule devam eder ama içerik çalışmaz)
/scoreboard players set #admin_loop global 0

# Ya da tamamen durdur
/schedule clear custom_admin:handler/loop/all/1
```

---

## 🛡️ GÜVENLİK ÖNLEMLERİ

### 1. Guard Kontrolü
Her schedule'lanmış fonksiyon şu kontrollerle başlar:

```mcfunction
# Flag kontrolü
execute unless score #admin_loop global matches 1 run return 0

# Oyuncu kontrolü
execute unless entity @a run return 0
```

### 2. Self-Reschedule
Her fonksiyon sonunda kendini yeniden planlar:

```mcfunction
schedule function custom_admin:handler/loop/all/1 2t replace
```

`replace` komutu **çok önemli** - çift çağrıları önler.

### 3. Temizlik Garantisi
`main:stop` içinde **TÜM** schedule'lar temizlenir:

```mcfunction
schedule clear global:tick
schedule clear custom_admin:handler/loop/all/1
schedule clear gulce_adminpower_addons:loop
# ...
```

---

## 🧪 TEST SENARYOLARı

### Test 1: Normal Çalışma
```mcfunction
/reload
/function main:load
# Oyunda dolaş, komutları test et
```

### Test 2: Reload Sonrası
```mcfunction
/reload
# Schedule'lar temizlendi mi kontrol et
/schedule list
```

### Test 3: Stop Sonrası
```mcfunction
/function main:stop
# Schedule'lar kaldı mı?
/schedule list
# Boş olmalı
```

### Test 4: Çoklu Reload
```mcfunction
/reload
/reload
/reload
# Hayalet tick'ler var mı?
/schedule list
```

---

## 🚨 SORUN GİDERME

### Sorun: "Schedule çalışmıyor"
**Çözüm:** Flag'leri kontrol et
```mcfunction
/scoreboard players get #admin_loop global
/scoreboard players get #global_tick global
```

### Sorun: "Çift tick oluşuyor"
**Çözüm:** `replace` parametresi eklenmiş mi kontrol et
```mcfunction
schedule function X 2t replace
```

### Sorun: "Reload sonrası devam ediyor"
**Çözüm:** `main:stop` çağır
```mcfunction
/function main:stop
/reload
/function main:load
```

---

## 📈 PERFORMANS KARŞILAŞTIRMA

### TPS Ölçümü

**Önce:**
```
/debug start
# 30 saniye bekle
/debug stop
# profiler/xxx.json aç → "tick" değerlerine bak
```

**Sonra:**
```
# Aynı testi tekrarla
# Karşılaştır
```

**Beklenen:**
- %10-15 TPS artışı
- %30 tick süre azalması
- Daha stabil mspt (ms per tick)

---

## ✅ KONTROL LİSTESİ

- [ ] Yedek alındı
- [ ] 7 dosya değiştirildi
- [ ] `/reload` yapıldı
- [ ] Schedule'lar başladı (`/schedule list`)
- [ ] Sistemler çalışıyor (GUI, admin, vb.)
- [ ] Stop testi yapıldı
- [ ] Reload testi yapıldı
- [ ] TPS ölçümü alındı

---

## 💡 GELİŞTİRME ÖNERİLERİ

### Sırada:
1. Permission tick optimizasyonu (trigger pre-check)
2. Entity tarama filtreleri (distance, limit)
3. Config sistemi (schedule aralıkları ayarlanabilir)

---

## 📞 DESTEK

Sorun olursa:
1. `/schedule list` çıktısını kontrol et
2. `/scoreboard players list global` kontrol et
3. Orjinal dosyaları geri yükle
4. Discord/GitHub'dan destek iste

---

**SON GÜNCELLEME:** 2026-01-27
**VERSİYON:** Schedule System v1.0
**DURUM:** Production Ready ✅
