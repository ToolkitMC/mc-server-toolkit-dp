# ---------------------------------------------------------
# [GulceOS] Başlatıcı
# ---------------------------------------------------------

# 1. VARSAYILAN DEĞER KONTROLÜ
# Config yolu yoksa güvenli bir şekilde oluşturur
execute unless data storage mc:config Config run data merge storage mc:config {Config:{Enabled:0b}}

# 2. DURUM KONTROLÜ & ERKEN ÇIKIŞ
# Eğer sistem zaten 1b (aktif) ise, işlemi burada keser ve aşağıdaki hiçbir komutu okumaz.
execute unless entity @a run return run tellraw @s {"text":"[GulceOS] OYUNCU BULUNAMADI!","color":"red","bold":true}
execute if data storage mc:config {Config:{Enabled:1b}} run return run tellraw @s {"text":"[GulceOS] ZATEN ETKİN!","color":"red","bold":true}

# 3. AKTİVASYON
# Kontrolü geçtiyse sistem kapalıdır, şimdi açıyoruz.
data modify storage mc:config Config.Enabled set value 1b
tellraw @a {"text":"[GulceOS] Hazırlanıyor...","color":"yellow"}

# 4. ŞARTLI FONKSİYON TETİKLEME
# 'execute if' kullanarak verinin başarıyla 1b olduğundan emin olarak çalıştırırız.
execute if data storage mc:config {Config:{Enabled:1b}} run function main:load/init
execute if data storage mc:config {Config:{Enabled:1b}} run data merge storage mc:trg {ui:1}
execute if data storage mc:config {Config:{Enabled:1b}} run function #multicommand:init
execute if data storage mc:config {Config:{Enabled:1b}} run function custom_admin:add/add_cooldown {playerName:"@a",cooldown:9999}
execute if data storage mc:config {Config:{Enabled:1b}} run scoreboard objectives add global dummy
execute if data storage mc:config {Config:{Enabled:1b}} run function main:init_globals

# ═══════════════════════════════════════════════════
# 5. SCHEDULE SİSTEMİ BAŞLATMA (YENİ!)
# ═══════════════════════════════════════════════════

# Global tick başlat (3 tick aralığı)
execute if data storage mc:config {Config:{Enabled:1b}} if score #global_tick global matches 1 run schedule function global:tick 3t replace

# Admin loop başlat (2 tick aralığı)
execute if data storage mc:config {Config:{Enabled:1b}} if score #admin_loop global matches 1 run schedule function custom_admin:handler/loop/all/1 2t replace

# Addons loop başlat (5 tick aralığı)
execute if data storage mc:config {Config:{Enabled:1b}} if score #main global matches 1 run schedule function gulce_adminpower_addons:loop 5t replace

# ═══════════════════════════════════════════════════
# 6. GSS SECURITY SUITE (YENİ!)
# ═══════════════════════════════════════════════════

# Bookshelf tabanlı güvenlik sistemi
execute if data storage mc:config {Config:{Enabled:1b}} run function gss_security:core/init

# ═══════════════════════════════════════════════════
# 7. BİTİŞ VE GERİ BİLDİRİM
# ═══════════════════════════════════════════════════

# Başarı mesajı sadece işlemler tamamlandığında @a (herkese) gider.
execute if data storage mc:config {Config:{Enabled:1b}} run playsound minecraft:block.stone_button.click_off master @a ~ ~ ~ 1 1 1
execute if data storage mc:config {Config:{Enabled:1b}} run tellraw @a ["",{"text":"[GulceOS] ","color":"dark_aqua"},{"text":"Sistem hazır! ✅","color":"green"}]
execute if data storage mc:config {Config:{Enabled:1b}} run function gulce_adminpower_addons:loaded
execute if data storage mc:config {Config:{Enabled:1b}} run tellraw @a ["",{"text":"[Schedule] ","color":"gold"},{"text":"Scheduled ticks aktif (TPS korumalı)","color":"yellow"}]
