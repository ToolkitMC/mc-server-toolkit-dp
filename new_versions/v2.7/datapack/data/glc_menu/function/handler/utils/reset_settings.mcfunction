# ═══════════════════════════════════════════════════
# Ayarları Varsayılana Sıfırla
# ═══════════════════════════════════════════════════

# Tüm ayarları varsayılan değerlere çek
scoreboard players set #opt_diamond_recipe gulce_id 0
scoreboard players set #opt_glc_menu gulce_id 1
scoreboard players set #opt_admin_loop gulce_id 1
scoreboard players set #opt_tick gulce_id 1
scoreboard players set #opt_cooldown gulce_id 1
scoreboard players set #opt_main_loop gulce_id 1

# Başarı mesajı
tellraw @s [{"text":"✅ ","color":"green"},{"text":"Ayarlar varsayılan değerlere sıfırlandı!","color":"white"}]
tellraw @s [{"text":"🔄 ","color":"yellow"},{"text":"Değişikliklerin uygulanması için ","color":"gray"},{"text":"'Ayarları Kaydet & Uygula'","color":"gold","bold":true},{"text":" butonuna basın.","color":"gray"}]

# Menüyü yenile
schedule function glc_menu:handler/builder/settings 5t
