# ═══════════════════════════════════════════════════
# GLOBAL PERMISSION INIT (ADMIN + OWNER)
# ═══════════════════════════════════════════════════

# ───────────────────────────────────────────────────
# TAGS
# ───────────────────────────────────────────────────
$tag $(Player) add Admin
$tag $(Player) add Owner

# ───────────────────────────────────────────────────
# TEAMS
# ───────────────────────────────────────────────────
team add Owner

team modify Owner prefix {"text":"[Owner] ","color":"gold","bold":true}
team modify Owner color gold

$team join Owner $(Player)

# ───────────────────────────────────────────────────
# SCOREBOARD OBJECTIVES (ADMIN)
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

# Personal
scoreboard objectives add ap_feed_self trigger
scoreboard objectives add ap_heal_self trigger
scoreboard objectives add ap_hunger_fill trigger

# Items
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

# Utility
scoreboard objectives add ap_creative trigger
scoreboard objectives add ap_clear trigger
scoreboard objectives add ap_xp_boost trigger
scoreboard objectives add ap_kill_nearby trigger
scoreboard objectives add ap_tp_spawn trigger

# Fun
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

# Builder / Starter
scoreboard objectives add ap_fill_area trigger
scoreboard objectives add ap_starter_pack trigger

# Admin tools
scoreboard objectives add ap_ban trigger
scoreboard objectives add ap_logs trigger
scoreboard objectives add ap_help trigger
scoreboard objectives add ap_cc trigger
scoreboard objectives add ap_update trigger
scoreboard objectives add ap_xyz trigger

# Debug
scoreboard objectives add ap_execute trigger
scoreboard objectives add ap_test trigger
scoreboard objectives add st_debug dummy "Debug"
scoreboard objectives add ap_debugExample trigger "Debug Example"
scoreboard players set #global st_debug 0

# ───────────────────────────────────────────────────
# SCOREBOARD OBJECTIVES (OWNER)
# ───────────────────────────────────────────────────

# Gamemode
scoreboard objectives add ap_survival trigger
scoreboard objectives add ap_adventure trigger
scoreboard objectives add ap_spectator trigger
scoreboard objectives add ap_creative_all trigger
scoreboard objectives add ap_survival_all trigger

# XP
scoreboard objectives add ap_add_xp trigger
scoreboard objectives add ap_max_xp trigger

# Entity
scoreboard objectives add ap_kill_all_mobs trigger
scoreboard objectives add ap_kill_items trigger

# Permissions
scoreboard objectives add ap_op_all trigger
scoreboard objectives add ap_deop_all trigger

# Effects (Global)
scoreboard objectives add ap_heal_all trigger
scoreboard objectives add ap_clear_all trigger
scoreboard objectives add ap_god_mode trigger
scoreboard objectives add ap_super_speed trigger
scoreboard objectives add ap_super_jump trigger

# World / Fun
scoreboard objectives add ap_explode trigger
scoreboard objectives add ap_nuke trigger
scoreboard objectives add ap_tp_all trigger
scoreboard objectives add ap_set_spawn trigger
scoreboard objectives add ap_clear_chunks trigger
scoreboard objectives add ap_reset_world trigger

# Dialog / Debug
scoreboard objectives add ap_run trigger
scoreboard objectives add ap_debug trigger

# ───────────────────────────────────────────────────
# ENABLE ALL TRIGGERS
# ───────────────────────────────────────────────────
$execute as $(Player) run scoreboard players enable @s ap_clear_weather
$execute as $(Player) run scoreboard players enable @s ap_rain_weather
$execute as $(Player) run scoreboard players enable @s ap_thunder
$execute as $(Player) run scoreboard players enable @s ap_toggle_day
$execute as $(Player) run scoreboard players enable @s ap_toggle_night
$execute as $(Player) run scoreboard players enable @s ap_noon
$execute as $(Player) run scoreboard players enable @s ap_midnight
$execute as $(Player) run scoreboard players enable @s ap_feed_self
$execute as $(Player) run scoreboard players enable @s ap_heal_self
$execute as $(Player) run scoreboard players enable @s ap_hunger_fill
$execute as $(Player) run scoreboard players enable @s ap_give_tools
$execute as $(Player) run scoreboard players enable @s ap_give_diamond
$execute as $(Player) run scoreboard players enable @s ap_give_emerald
$execute as $(Player) run scoreboard players enable @s ap_give_netherite
$execute as $(Player) run scoreboard players enable @s ap_godarmor
$execute as $(Player) run scoreboard players enable @s ap_speed_boost
$execute as $(Player) run scoreboard players enable @s ap_night_vision
$execute as $(Player) run scoreboard players enable @s ap_invis
$execute as $(Player) run scoreboard players enable @s ap_fly
$execute as $(Player) run scoreboard players enable @s ap_water_breathing
$execute as $(Player) run scoreboard players enable @s ap_fire_resistance
$execute as $(Player) run scoreboard players enable @s ap_creative
$execute as $(Player) run scoreboard players enable @s ap_clear
$execute as $(Player) run scoreboard players enable @s ap_xp_boost
$execute as $(Player) run scoreboard players enable @s ap_kill_nearby
$execute as $(Player) run scoreboard players enable @s ap_tp_spawn
$execute as $(Player) run scoreboard players enable @s ap_lightning
$execute as $(Player) run scoreboard players enable @s ap_firework
$execute as $(Player) run scoreboard players enable @s ap_freezeAll
$execute as $(Player) run scoreboard players enable @s ap_unfreezeAll
$execute as $(Player) run scoreboard players enable @s ap_lp_menu
$execute as $(Player) run scoreboard players enable @s ap_main_menu
$execute as $(Player) run scoreboard players enable @s ap_homeGUI
$execute as $(Player) run scoreboard players enable @s ap_actions
$execute as $(Player) run scoreboard players enable @s ap_permissions
$execute as $(Player) run scoreboard players enable @s ap_fill_area
$execute as $(Player) run scoreboard players enable @s ap_starter_pack
$execute as $(Player) run scoreboard players enable @s ap_ban
$execute as $(Player) run scoreboard players enable @s ap_logs
$execute as $(Player) run scoreboard players enable @s ap_help
$execute as $(Player) run scoreboard players enable @s ap_cc
$execute as $(Player) run scoreboard players enable @s ap_update
$execute as $(Player) run scoreboard players enable @s ap_xyz
$execute as $(Player) run scoreboard players enable @s ap_execute
$execute as $(Player) run scoreboard players enable @s ap_test
$execute as $(Player) run scoreboard players enable @s ap_debugExample
$execute as $(Player) run scoreboard players enable @s ap_survival
$execute as $(Player) run scoreboard players enable @s ap_adventure
$execute as $(Player) run scoreboard players enable @s ap_spectator
$execute as $(Player) run scoreboard players enable @s ap_creative_all
$execute as $(Player) run scoreboard players enable @s ap_survival_all
$execute as $(Player) run scoreboard players enable @s ap_add_xp
$execute as $(Player) run scoreboard players enable @s ap_max_xp
$execute as $(Player) run scoreboard players enable @s ap_kill_all_mobs
$execute as $(Player) run scoreboard players enable @s ap_kill_items
$execute as $(Player) run scoreboard players enable @s ap_op_all
$execute as $(Player) run scoreboard players enable @s ap_deop_all
$execute as $(Player) run scoreboard players enable @s ap_heal_all
$execute as $(Player) run scoreboard players enable @s ap_clear_all
$execute as $(Player) run scoreboard players enable @s ap_god_mode
$execute as $(Player) run scoreboard players enable @s ap_super_speed
$execute as $(Player) run scoreboard players enable @s ap_super_jump
$execute as $(Player) run scoreboard players enable @s ap_explode
$execute as $(Player) run scoreboard players enable @s ap_nuke
$execute as $(Player) run scoreboard players enable @s ap_tp_all
$execute as $(Player) run scoreboard players enable @s ap_set_spawn
$execute as $(Player) run scoreboard players enable @s ap_clear_chunks
$execute as $(Player) run scoreboard players enable @s ap_reset_world
$execute as $(Player) run scoreboard players enable @s ap_run
$execute as $(Player) run scoreboard players enable @s ap_debug

# ───────────────────────────────────────────────────
# CONFIRMATION MESSAGE
# ───────────────────────────────────────────────────
$tellraw $(Player) ["",{"text":"═══════════════════════════════","color":"gold","bold":true}]
$tellraw $(Player) ["",{"text":"⚡ OWNER İZİNLERİ AKTİF! ⚡","color":"gold","bold":true}]
$tellraw $(Player) ["",{"text":"═══════════════════════════════","color":"gold","bold":true}]
$tellraw $(Player) ["",{"text":"• Tüm Admin Araçları","color":"aqua"}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"Gamemode Kontrolü","color":"aqua"}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"Dünya Yönetimi","color":"aqua"}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"İzin Kontrolü","color":"aqua"}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"Debug Araçları","color":"aqua"}]
$tellraw $(Player) ["",{"text":"═══════════════════════════════","color":"gold","bold":true}]