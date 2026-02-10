# ─────────────────────────────
# AYARLARI UYGULA (Wrapper)
# ─────────────────────────────
# Scoreboard'dan değerleri okuyup set_globals'a makro olarak gönderir

# Değerleri storage'a kopyala
execute store result storage main:temp glc_menu int 1 run scoreboard players get #glc_menu_active global
execute store result storage main:temp admin_loop int 1 run scoreboard players get #admin_loop global
execute store result storage main:temp tick int 1 run scoreboard players get #global_tick global
execute store result storage main:temp cooldown int 1 run scoreboard players get #cooldown_active global
execute store result storage main:temp main int 1 run scoreboard players get #main global

# Aç / Kapat
execute if score #opt_diamond_recipe gulce_id matches 0 run scoreboard players set #opt_diamond_recipe gulce_id 1
execute if score #opt_diamond_recipe gulce_id matches 1 run scoreboard players set #opt_diamond_recipe gulce_id 0

# Makro ile set_globals çağır
function main:set_globals with storage main:temp
function gulce_adminpower_addons:config/load with storage custom:storage config

tellraw @s {"text":"✅ Ayarlar başarıyla uygulandı!","color":"green"}