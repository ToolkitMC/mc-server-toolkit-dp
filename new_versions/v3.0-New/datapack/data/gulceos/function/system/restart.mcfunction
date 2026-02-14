# [GulceOS] Restarting...
tellraw @a[tag=gulce_debug] {"text":"[GulceOS] Restarting and Rebuilding...","color":"yellow"}

# --- TEMİZLİK (Sıfırlama) ---
scoreboard objectives remove ap_clear_weather
scoreboard objectives remove ap_feed_self
scoreboard objectives remove ap_give_tools
scoreboard objectives remove ap_heal_self
scoreboard objectives remove ap_rain_weather
scoreboard objectives remove ap_speed_boost
scoreboard objectives remove ap_toggle_day
scoreboard objectives remove ap_toggle_night
scoreboard objectives remove ap_logs
scoreboard objectives remove ap_actions
scoreboard objectives remove ap_survival
scoreboard objectives remove ap_adventure
scoreboard objectives remove ap_spectator
scoreboard objectives remove ap_add_xp
scoreboard objectives remove ap_kill_all_mobs
scoreboard objectives remove ap_run
scoreboard objectives remove ap_lp_menu
scoreboard objectives remove ap_creative
scoreboard objectives remove ap_main_menu
scoreboard objectives remove ap_sethome
scoreboard objectives remove ap_home
scoreboard objectives remove ap_fill_area
scoreboard objectives remove ap_time_day
scoreboard objectives remove ap_gamemode_creative
scoreboard objectives remove permission_level
scoreboard objectives remove ap_config
scoreboard objectives remove gulce_click
scoreboard objectives remove gulce_menu
scoreboard objectives remove gulce_load.dialog
scoreboard objectives remove gulce_cooldown
scoreboard objectives remove gulce_id
scoreboard objectives remove gulce_perm
scoreboard objectives remove gulce_timer
scoreboard objectives remove gulce_trigger
scoreboard objectives remove ap_gamemode
scoreboard objectives remove ap_cc
scoreboard objectives remove ap_help
scoreboard objectives remove ap_homeGUI
scoreboard objectives remove ap_rain
scoreboard objectives remove ap_update
scoreboard objectives remove ap_time
scoreboard objectives remove gulceos.const

data remove storage custom:storage Starter
data remove storage custom:storage mode
data remove storage custom:storage Data
data remove storage custom:storage Temp
data remove storage custom:storage Log
data remove storage userfunc:log actions
data remove storage userfunc:log errors
data remove storage userfunc:log Player
data remove storage mc:config Config
data remove storage mc:trg ui

tag @a remove op
tag @a remove Owner
tag @a remove mod
tag @a remove Builder

schedule clear global:tick
schedule clear main:loop/init

# --- GERİ EKLEME (Initialization) ---

# Scoreboardları Yeniden Tanımla
scoreboard objectives add ap_clear_weather dummy
scoreboard objectives add ap_feed_self dummy
scoreboard objectives add ap_give_tools dummy
scoreboard objectives add ap_heal_self dummy
scoreboard objectives add ap_rain_weather dummy
scoreboard objectives add ap_speed_boost dummy
scoreboard objectives add ap_toggle_day dummy
scoreboard objectives add ap_toggle_night dummy
scoreboard objectives add ap_logs dummy
scoreboard objectives add ap_actions dummy
scoreboard objectives add ap_survival dummy
scoreboard objectives add ap_adventure dummy
scoreboard objectives add ap_spectator dummy
scoreboard objectives add ap_add_xp dummy
scoreboard objectives add ap_kill_all_mobs dummy
scoreboard objectives add ap_run dummy
scoreboard objectives add ap_lp_menu dummy
scoreboard objectives add ap_creative dummy
scoreboard objectives add ap_main_menu dummy
scoreboard objectives add ap_sethome dummy
scoreboard objectives add ap_home dummy
scoreboard objectives add ap_fill_area dummy
scoreboard objectives add ap_time_day dummy
scoreboard objectives add ap_gamemode_creative dummy
scoreboard objectives add permission_level dummy
scoreboard objectives add ap_config dummy
scoreboard objectives add gulce_click dummy
scoreboard objectives add gulce_menu dummy
scoreboard objectives add gulce_load.dialog dummy
scoreboard objectives add gulce_cooldown dummy
scoreboard objectives add gulce_id dummy
scoreboard objectives add gulce_perm dummy
scoreboard objectives add gulce_timer dummy
scoreboard objectives add gulce_trigger dummy
scoreboard objectives add ap_gamemode dummy
scoreboard objectives add ap_cc dummy
scoreboard objectives add ap_help dummy
scoreboard objectives add ap_homeGUI dummy
scoreboard objectives add ap_rain dummy
scoreboard objectives add ap_update dummy
scoreboard objectives add ap_time dummy
scoreboard objectives add gulceos.const dummy

# Sabit Değerleri ve Fonksiyonları Başlat
scoreboard players set #loaded gulceos.const 1
function custom_admin:load
function custom_admin:handler/load/1
function glc_menu:handler/load
function cooldown:init

# Storage Verilerini Yapılandır
data modify storage custom:storage Starter set value {}
data modify storage custom:storage Temp.Trigger set value []
data modify storage custom:storage Temp.Trigger append value {"command":"say ✅","number":1,"score":"ap_test","tag":"op"}
data modify storage custom:storage Temp.Trigger append value {"command":"say ❌","number":2,"score":"ap_test","tag":"op"}
data modify storage mc:config Config set value {Enabled:1b}

tellraw @a[tag=gulce_debug] {"text":"[GulceOS] System Ready!","color":"green"}
