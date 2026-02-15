# ═══════════════════════════════════════════════════
# ADMIN PERMISSION INIT
# Admin izinlerini başlat ve scoreboard'ları oluştur
# ═══════════════════════════════════════════════════

# Oyuncu adını al
$execute as $(Player) at @s run function glc_menu:handler/utils/player_name

# Tag'leri ekle
$tag $(Player) add Admin
$tag $(Player) add gulce_admin

# Team ayarları
team add Admin
team modify Admin prefix {"text":"[Admin] ","color":"red","bold":true}
team modify Admin color red
$team join Admin $(Player)

# ───────────────────────────────────────────────────
# SCOREBOARD OBJECTİVES (Trigger / Dummy)
# ───────────────────────────────────────────────────

# Weather
scoreboard objectives add ap_clear_weather trigger
scoreboard objectives add ap_rain_weather trigger
scoreboard objectives add ap_thunder trigger

# Time
scoreboard objectives add ap_toggle_day trigger
scoreboard objectives add ap_toggle_night trigger
scoreboard objectives add ap_noon trigger
scoreboard objectives add ap_midnight trigger

# Personal Care
scoreboard objectives add ap_feed_self trigger
scoreboard objectives add ap_heal_self trigger
scoreboard objectives add ap_hunger_fill trigger

# Items & Tools
scoreboard objectives add ap_give_tools trigger
scoreboard objectives add ap_give_diamond trigger
scoreboard objectives add ap_give_emerald trigger
scoreboard objectives add ap_give_netherite trigger
scoreboard objectives add ap_godarmor trigger

# Effects
scoreboard objectives add ap_speed_boost trigger
scoreboard objectives add ap_night_vision trigger
scoreboard objectives add ap_invis trigger
scoreboard objectives add ap_fly trigger
scoreboard objectives add ap_water_breathing trigger
scoreboard objectives add ap_fire_resistance trigger

# Gamemode
scoreboard objectives add ap_creative trigger

# Inventory
scoreboard objectives add ap_clear trigger

# Experience
scoreboard objectives add ap_xp_boost trigger

# Entities
scoreboard objectives add ap_kill_nearby trigger

# Teleportation
scoreboard objectives add ap_tp_spawn trigger

# Fun Effects
scoreboard objectives add ap_lightning trigger
scoreboard objectives add ap_firework trigger

# Freeze
scoreboard objectives add ap_freezeAll trigger
scoreboard objectives add ap_unfreezeAll trigger

# Menus
scoreboard objectives add ap_lp_menu trigger
scoreboard objectives add ap_main_menu trigger
scoreboard objectives add ap_homeGUI trigger
scoreboard objectives add ap_actions trigger
scoreboard objectives add ap_permissions trigger

# Builder
scoreboard objectives add ap_fill_area trigger

# Starter
scoreboard objectives add ap_starter_pack trigger

# Admin Tools
scoreboard objectives add ap_ban trigger
scoreboard objectives add ap_logs trigger
scoreboard objectives add ap_help trigger
scoreboard objectives add ap_cc trigger
scoreboard objectives add ap_update trigger

# Coordinates
scoreboard objectives add ap_xyz trigger

# Test
scoreboard objectives add ap_test trigger

# Hata Ayıklama ve Çalıştırma
scoreboard objectives add ap_execute trigger
scoreboard objectives add st_debug dummy "Debug"
scoreboard objectives add ap_debugExample trigger "Debug örneği"
scoreboard players set #global st_debug 0

# ───────────────────────────────────────────────────
# ENABLE TRIGGERS
# ───────────────────────────────────────────────────
$scoreboard players enable $(Player) ap_clear_weather
$scoreboard players enable $(Player) ap_rain_weather
$scoreboard players enable $(Player) ap_thunder
$scoreboard players enable $(Player) ap_toggle_day
$scoreboard players enable $(Player) ap_toggle_night
$scoreboard players enable $(Player) ap_noon
$scoreboard players enable $(Player) ap_midnight
$scoreboard players enable $(Player) ap_feed_self
$scoreboard players enable $(Player) ap_heal_self
$scoreboard players enable $(Player) ap_hunger_fill
$scoreboard players enable $(Player) ap_give_tools
$scoreboard players enable $(Player) ap_give_diamond
$scoreboard players enable $(Player) ap_give_emerald
$scoreboard players enable $(Player) ap_give_netherite
$scoreboard players enable $(Player) ap_godarmor
$scoreboard players enable $(Player) ap_speed_boost
$scoreboard players enable $(Player) ap_night_vision
$scoreboard players enable $(Player) ap_invis
$scoreboard players enable $(Player) ap_fly
$scoreboard players enable $(Player) ap_water_breathing
$scoreboard players enable $(Player) ap_fire_resistance
$scoreboard players enable $(Player) ap_creative
$scoreboard players enable $(Player) ap_clear
$scoreboard players enable $(Player) ap_xp_boost
$scoreboard players enable $(Player) ap_kill_nearby
$scoreboard players enable $(Player) ap_tp_spawn
$scoreboard players enable $(Player) ap_lightning
$scoreboard players enable $(Player) ap_firework
$scoreboard players enable $(Player) ap_freezeAll
$scoreboard players enable $(Player) ap_unfreezeAll
$scoreboard players enable $(Player) ap_lp_menu
$scoreboard players enable $(Player) ap_main_menu
$scoreboard players enable $(Player) ap_homeGUI
$scoreboard players enable $(Player) ap_actions
$scoreboard players enable $(Player) ap_permissions
$scoreboard players enable $(Player) ap_fill_area
$scoreboard players enable $(Player) ap_starter_pack
$scoreboard players enable $(Player) ap_ban
$scoreboard players enable $(Player) ap_logs
$scoreboard players enable $(Player) ap_help
$scoreboard players enable $(Player) ap_cc
$scoreboard players enable $(Player) ap_update
$scoreboard players enable $(Player) ap_xyz
$scoreboard players enable $(Player) ap_test
$scoreboard players enable $(Player) ap_execute
$scoreboard players enable $(Player) ap_debugExample
$scoreboard players enable $(Player) ap_sit

# ───────────────────────────────────────────────────
# CONFIRMATION MESSAGE
# ───────────────────────────────────────────────────
$tellraw $(Player) ["",{"text":"═══════════════════════════════","color":"red","bold":true}]
$tellraw $(Player) ["",{"text":"⚔ ADMIN İZİNLERİ AKTİF! ⚔","color":"red","bold":true}]
$tellraw $(Player) ["",{"text":"═══════════════════════════════","color":"red","bold":true}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"Hava & Zaman Kontrolü","color":"aqua"}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"Araçlar & Eşyalar","color":"aqua"}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"Efektler & Yetenekler","color":"aqua"}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"Admin Menüleri","color":"aqua"}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"Hata Ayıklama ve Çalıştırma","color":"aqua"}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"GULCE-MENU erisimi","color":"aqua"}]
$tellraw $(Player) ["",{"text":"═══════════════════════════════","color":"red","bold":true}]

particle minecraft:firework ~ ~ ~ 2 2 2 0.2 300 force
playsound minecraft:entity.firework_rocket.launch master @a ~ ~ ~ 1 1
playsound minecraft:entity.firework_rocket.large_blast master @a ~ ~ ~ 2 1 0
playsound minecraft:entity.firework_rocket.twinkle master @a ~ ~ ~ 1 1