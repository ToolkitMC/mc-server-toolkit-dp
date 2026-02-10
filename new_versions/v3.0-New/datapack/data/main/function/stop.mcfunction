# [GulceOS] Sistemi Kapatılıyor...
# ---------------------------------------------------------

# 1. DURUM KONTROLÜ
# Sistem zaten kapalıysa işlemi durdur (gereksiz komut kalabalığını önler)
execute unless data storage mc:config {Config:{Enabled:1b}} run return run tellraw @s {"text":"[GulceOS] SİSTEM ZATEN KAPALI!","color":"yellow"}

# 2. GÖRSEL VE SESLİ BİLDİRİM
tellraw @a {"text":"[GulceOS] Sistem devre dışı bırakılıyor...","color":"red"}
playsound minecraft:block.iron_trapdoor.close master @a ~ ~ ~ 1 0.5 1

# ═══════════════════════════════════════════════════
# 3. SCHEDULE TEMİZLİĞİ (ÖNEMLİ!)
# Tüm scheduled fonksiyonları temizle
# ═══════════════════════════════════════════════════

schedule clear global:tick
schedule clear main:loop/init
schedule clear custom_admin:handler/loop/all/1
schedule clear gulce_adminpower_addons:loop
schedule clear glc_menu:handler/tick

# Diğer schedule'lar (varsa)
schedule clear cooldown:loop
schedule clear gulceos:updater/activate
schedule clear custom_admin:run/trigger

tellraw @a ["",{"text":"[Schedule] ","color":"gold"},{"text":"Tüm scheduled tick'ler temizlendi","color":"gray"}]

# ═══════════════════════════════════════════════════
# 4. VERİLERİ TEMİZLE
# ═══════════════════════════════════════════════════

# Enabled değerini 0 yap ve config storage'ı tamamen sil
data modify storage mc:config Config.Enabled set value 0b
data remove storage mc:config Config
data remove storage mc:trg ui

# ═══════════════════════════════════════════════════
# 5. SKORLARI TEMİZLE (Toplu Silme)
# ═══════════════════════════════════════════════════

scoreboard objectives remove gulce_click
scoreboard objectives remove gulce_menu
scoreboard objectives remove gulce_load.dialog
scoreboard objectives remove gulce_cooldown
scoreboard objectives remove gulce_id
scoreboard objectives remove gulce_perm
scoreboard objectives remove gulce_timer
scoreboard objectives remove gulce_trigger

# AP Skorları
scoreboard objectives remove ap_gamemode
scoreboard objectives remove ap_cc
scoreboard objectives remove ap_help
scoreboard objectives remove ap_homeGUI
scoreboard objectives remove ap_rain
scoreboard objectives remove ap_update
scoreboard objectives remove ap_time

# Global flags
scoreboard players reset #glc_menu_active global
scoreboard players reset #admin_loop global
scoreboard players reset #global_tick global
scoreboard players reset #cooldown_active global
scoreboard players reset #main global

# ═══════════════════════════════════════════════════
# 6. ÖZEL DURDURMA FONKSİYONU
# ═══════════════════════════════════════════════════

# Eğer admin panelinde özel bir durdurma işlemi varsa onu tetikle
function custom_admin:stop

tellraw @s {"text":"[GulceOS] Tüm veriler, skorlar ve schedule'lar temizlendi. ✅","color":"green"}
