# ═══════════════════════════════════════════════════
# ADMIN PERMISSIONS - TICK HANDLER
# Admin ve Owner tag'ine sahip oyuncular için
# ═══════════════════════════════════════════════════

# ───────────────────────────────────────────────────
# WEATHER CONTROLS
# ───────────────────────────────────────────────────
execute as @a[scores={ap_clear_weather=1..},tag=Admin] run function custom_admin:clear_weather
execute as @a[scores={ap_clear_weather=1..},tag=Admin] run tellraw @s {"text":"[Admin] Hava temizlendi","color":"aqua"}
scoreboard players set @a[scores={ap_clear_weather=1..}] ap_clear_weather 0

execute as @a[scores={ap_rain_weather=1..},tag=Admin] run function custom_admin:rain_weather
execute as @a[scores={ap_rain_weather=1..},tag=Admin] run tellraw @s {"text":"[Admin] Yağmur başlatıldı","color":"blue"}
scoreboard players set @a[scores={ap_rain_weather=1..}] ap_rain_weather 0

execute as @a[scores={ap_thunder=1..},tag=Admin] run weather thunder
execute as @a[scores={ap_thunder=1..},tag=Admin] run tellraw @s {"text":"[Admin] Fırtına başlatıldı!","color":"dark_gray"}
scoreboard players set @a[scores={ap_thunder=1..}] ap_thunder 0

# ───────────────────────────────────────────────────
# TIME CONTROLS
# ───────────────────────────────────────────────────
execute as @a[scores={ap_toggle_day=1..},tag=Admin] run function custom_admin:toggle_day
execute as @a[scores={ap_toggle_day=1..},tag=Admin] run tellraw @s {"text":"[Admin] Gündüz yapıldı","color":"yellow"}
scoreboard players set @a[scores={ap_toggle_day=1..}] ap_toggle_day 0

execute as @a[scores={ap_toggle_night=1..},tag=Admin] run function custom_admin:toggle_night
execute as @a[scores={ap_toggle_night=1..},tag=Admin] run tellraw @s {"text":"[Admin] Gece yapıldı","color":"dark_blue"}
scoreboard players set @a[scores={ap_toggle_night=1..}] ap_toggle_night 0

execute as @a[scores={ap_noon=1..},tag=Admin] run time set noon
execute as @a[scores={ap_noon=1..},tag=Admin] run tellraw @s {"text":"[Admin] Öğle saati","color":"gold"}
scoreboard players set @a[scores={ap_noon=1..}] ap_noon 0

execute as @a[scores={ap_midnight=1..},tag=Admin] run time set midnight
execute as @a[scores={ap_midnight=1..},tag=Admin] run tellraw @s {"text":"[Admin] Gece yarısı","color":"dark_purple"}
scoreboard players set @a[scores={ap_midnight=1..}] ap_midnight 0

# ───────────────────────────────────────────────────
# PERSONAL CARE
# ───────────────────────────────────────────────────
execute as @a[scores={ap_feed_self=1..},tag=Admin] run function custom_admin:feed_self
execute as @a[scores={ap_feed_self=1..},tag=Admin] run tellraw @s {"text":"[Admin] Açlık dolduruldu","color":"green"}
scoreboard players set @a[scores={ap_feed_self=1..}] ap_feed_self 0

execute as @a[scores={ap_heal_self=1..},tag=Admin] run function custom_admin:heal_self
execute as @a[scores={ap_heal_self=1..},tag=Admin] run tellraw @s {"text":"[Admin] İyileştirildin","color":"green"}
scoreboard players set @a[scores={ap_heal_self=1..}] ap_heal_self 0

execute as @a[scores={ap_hunger_fill=1..},tag=Admin] run effect give @s saturation 1 255 true
execute as @a[scores={ap_hunger_fill=1..},tag=Admin] run tellraw @s {"text":"[Admin] Açlık bar dolduruldu","color":"gold"}
scoreboard players set @a[scores={ap_hunger_fill=1..}] ap_hunger_fill 0

# ───────────────────────────────────────────────────
# ITEMS & TOOLS
# ───────────────────────────────────────────────────
execute as @a[scores={ap_give_tools=1..},tag=Admin] run function custom_admin:give_tools
execute as @a[scores={ap_give_tools=1..},tag=Admin] run tellraw @s {"text":"[Admin] Araçlar verildi","color":"aqua"}
scoreboard players set @a[scores={ap_give_tools=1..}] ap_give_tools 0

execute as @a[scores={ap_give_diamond=1..},tag=Admin] run give @s diamond 64
execute as @a[scores={ap_give_diamond=1..},tag=Admin] run tellraw @s {"text":"[Admin] +64 Elmas verildi","color":"aqua"}
scoreboard players set @a[scores={ap_give_diamond=1..}] ap_give_diamond 0

execute as @a[scores={ap_give_emerald=1..},tag=Admin] run give @s emerald 64
execute as @a[scores={ap_give_emerald=1..},tag=Admin] run tellraw @s {"text":"[Admin] +64 Zümrüt verildi","color":"green"}
scoreboard players set @a[scores={ap_give_emerald=1..}] ap_give_emerald 0

execute as @a[scores={ap_give_netherite=1..},tag=Admin] run give @s netherite_ingot 16
execute as @a[scores={ap_give_netherite=1..},tag=Admin] run tellraw @s {"text":"[Admin] +16 Netherite verildi","color":"dark_purple"}
scoreboard players set @a[scores={ap_give_netherite=1..}] ap_give_netherite 0

execute as @a[scores={ap_godarmor=1..},tag=Admin] run function custom:tools/godarmor {"target":"@s"}
execute as @a[scores={ap_godarmor=1..},tag=Admin] run tellraw @s {"text":"[Admin] Tanrı zırhı giydirildi!","color":"light_purple","bold":true}
scoreboard players set @a[scores={ap_godarmor=1..}] ap_godarmor 0

# ───────────────────────────────────────────────────
# EFFECTS & BUFFS
# ───────────────────────────────────────────────────
execute as @a[scores={ap_speed_boost=1..},tag=Admin] run function custom_admin:speed_boost
execute as @a[scores={ap_speed_boost=1..},tag=Admin] run tellraw @s {"text":"[Admin] Hız arttırıldı","color":"aqua"}
scoreboard players set @a[scores={ap_speed_boost=1..}] ap_speed_boost 0

execute as @a[scores={ap_night_vision=1..},tag=Admin] run effect give @s night_vision 300 1 true
execute as @a[scores={ap_night_vision=1..},tag=Admin] run tellraw @s {"text":"[Admin] Gece görüşü aktif","color":"dark_aqua"}
scoreboard players set @a[scores={ap_night_vision=1..}] ap_night_vision 0

execute as @a[scores={ap_invis=1..},tag=Admin] run effect give @s invisibility 60 1 true
execute as @a[scores={ap_invis=1..},tag=Admin] run tellraw @s {"text":"[Admin] Görünmezlik aktif","color":"gray"}
scoreboard players set @a[scores={ap_invis=1..}] ap_invis 0

execute as @a[scores={ap_fly=1..},tag=Admin] run effect give @s levitation 10 255 true
execute as @a[scores={ap_fly=1..},tag=Admin] run tellraw @s {"text":"[Admin] Uçuş başlatıldı!","color":"light_purple"}
scoreboard players set @a[scores={ap_fly=1..}] ap_fly 0

execute as @a[scores={ap_water_breathing=1..},tag=Admin] run effect give @s water_breathing 600 1 true
execute as @a[scores={ap_water_breathing=1..},tag=Admin] run tellraw @s {"text":"[Admin] Su altı nefesi aktif","color":"blue"}
scoreboard players set @a[scores={ap_water_breathing=1..}] ap_water_breathing 0

execute as @a[scores={ap_fire_resistance=1..},tag=Admin] run effect give @s fire_resistance 600 1 true
execute as @a[scores={ap_fire_resistance=1..},tag=Admin] run tellraw @s {"text":"[Admin] Ateş direnci aktif","color":"red"}
scoreboard players set @a[scores={ap_fire_resistance=1..}] ap_fire_resistance 0

# ───────────────────────────────────────────────────
# GAMEMODE
# ───────────────────────────────────────────────────
execute as @a[scores={ap_creative=1..},tag=Admin] run gamemode creative @s
execute as @a[scores={ap_creative=1..},tag=Admin] run tellraw @s {"text":"[Admin] Creative moduna geçildi","color":"gold"}
scoreboard players set @a[scores={ap_creative=1..}] ap_creative 0

# ───────────────────────────────────────────────────
# INVENTORY MANAGEMENT
# ───────────────────────────────────────────────────
execute as @a[scores={ap_clear=1..},tag=Admin] run clear @s *
execute as @a[scores={ap_clear=1..},tag=Admin] run tellraw @s {"text":"[Admin] Envanter temizlendi","color":"yellow"}
scoreboard players set @a[scores={ap_clear=1..}] ap_clear 0

# ───────────────────────────────────────────────────
# EXPERIENCE
# ───────────────────────────────────────────────────
execute as @a[scores={ap_xp_boost=1..},tag=Admin] run xp add @s 1000 points
execute as @a[scores={ap_xp_boost=1..},tag=Admin] run tellraw @s {"text":"[Admin] +1000 XP verildi","color":"gold"}
scoreboard players set @a[scores={ap_xp_boost=1..}] ap_xp_boost 0

# ───────────────────────────────────────────────────
# ENTITY MANAGEMENT
# ───────────────────────────────────────────────────
execute as @a[scores={ap_kill_nearby=1..},tag=Admin] at @s run kill @e[type=!player,distance=..20]
execute as @a[scores={ap_kill_nearby=1..},tag=Admin] run tellraw @s {"text":"[Admin] Yakındaki moblar temizlendi","color":"red"}
scoreboard players set @a[scores={ap_kill_nearby=1..}] ap_kill_nearby 0

# ───────────────────────────────────────────────────
# TELEPORTATION
# ───────────────────────────────────────────────────
execute as @a[scores={ap_tp_spawn=1..},tag=Admin] run tp @s ~ ~100 ~
execute as @a[scores={ap_tp_spawn=1..},tag=Admin] run tellraw @s {"text":"[Admin] Spawn'a ışınlandın","color":"light_purple"}
scoreboard players set @a[scores={ap_tp_spawn=1..}] ap_tp_spawn 0

# ───────────────────────────────────────────────────
# FUN EFFECTS
# ───────────────────────────────────────────────────
execute as @a[scores={ap_lightning=1..},tag=Admin] at @s run summon lightning_bolt ~ ~ ~
execute as @a[scores={ap_lightning=1..},tag=Admin] run tellraw @s {"text":"[Admin] Şimşek çağrıldı! ⚡","color":"yellow","bold":true}
scoreboard players set @a[scores={ap_lightning=1..}] ap_lightning 0

execute as @a[scores={ap_firework=1..},tag=Admin] at @s run summon firework_rocket ~ ~2 ~ {FireworksItem:{id:"firework_rocket",count:1,components:{"fireworks":{explosions:[{shape:"large_ball",colors:[I;16711680,65280,255]}]}}}}
execute as @a[scores={ap_firework=1..},tag=Admin] run tellraw @s {"text":"[Admin] Havai fişek patlatıldı! 🎆","color":"light_purple"}
scoreboard players set @a[scores={ap_firework=1..}] ap_firework 0

# ───────────────────────────────────────────────────
# FREEZE SYSTEM
# ───────────────────────────────────────────────────
execute as @a[scores={ap_freezeAll=1..},tag=Admin] run function custom:freeze_on {player:"@a"}
execute as @a[scores={ap_freezeAll=1..},tag=Admin] run tellraw @a {"text":"[Admin] Herkes donduruldu!","color":"aqua","bold":true}
scoreboard players set @a[scores={ap_freezeAll=1..}] ap_freezeAll 0

execute as @a[scores={ap_unfreezeAll=1..},tag=Admin] run function custom:freeze_off {player:"@a"}
execute as @a[scores={ap_unfreezeAll=1..},tag=Admin] run tellraw @a {"text":"[Admin] Donma çözüldü!","color":"green"}
scoreboard players set @a[scores={ap_unfreezeAll=1..}] ap_unfreezeAll 0

# ───────────────────────────────────────────────────
# MENUS & DIALOGS
# ───────────────────────────────────────────────────
execute as @a[scores={ap_lp_menu=1..},tag=Admin] run function custom:lp/menu
scoreboard players set @a[scores={ap_lp_menu=1..}] ap_lp_menu 0

execute as @a[scores={ap_main_menu=1..},tag=Admin] run function custom:menu/open
scoreboard players set @a[scores={ap_main_menu=1..}] ap_main_menu 0

execute as @a[scores={ap_homeGUI=1..},tag=Admin] run dialog show @s custom:home
scoreboard players set @a[scores={ap_homeGUI=1..}] ap_homeGUI 0

execute as @a[scores={ap_actions=1..},tag=Admin] run function actions:menu/open
scoreboard players set @a[scores={ap_actions=1..}] ap_actions 0

execute as @a[scores={ap_permissions=1..},tag=Admin] run function glc_menu:handler/builder/main
scoreboard players set @a[scores={ap_permissions=1..}] ap_permissions 0

# ───────────────────────────────────────────────────
# BUILDER TOOLS
# ───────────────────────────────────────────────────
execute as @a[scores={ap_fill_area=1..},tag=Admin] at @s run function custom:permissions/builder/actions/fill_gui
scoreboard players set @a[scores={ap_fill_area=1..}] ap_fill_area 0

# ───────────────────────────────────────────────────
# STARTER PACK
# ───────────────────────────────────────────────────
execute as @a[scores={ap_starter_pack=1..},tag=Admin] run function custom:starter_pack
execute as @a[scores={ap_starter_pack=1..},tag=Admin] run tellraw @s {"text":"[Admin] Başlangıç paketi verildi","color":"green"}
scoreboard players set @a[scores={ap_starter_pack=1..}] ap_starter_pack 0

# ───────────────────────────────────────────────────
# ADMIN TOOLS
# ───────────────────────────────────────────────────
execute as @a[scores={ap_ban=1..},tag=Admin] run function custom:tools/kick/menu
scoreboard players set @a[scores={ap_ban=1..}] ap_ban 0

execute as @a[scores={ap_logs=1..},tag=Admin] run function _custom:logs
scoreboard players set @a[scores={ap_logs=1..}] ap_logs 0

execute as @a[scores={ap_help=1..},tag=Admin] run function custom:help
scoreboard players set @a[scores={ap_help=1..}] ap_help 0

execute as @a[scores={ap_cc=1..},tag=Admin] run function _custom:clear_chat
scoreboard players set @a[scores={ap_cc=1..}] ap_cc 0

execute as @a[scores={ap_update=1..},tag=Admin] run function gulceos:update
scoreboard players set @a[scores={ap_update=1..}] ap_update 0

# ───────────────────────────────────────────────────
# COORDINATE DISPLAY
# ───────────────────────────────────────────────────
execute as @a[scores={ap_xyz=1..},tag=Admin] run function custom:permissions/admin/commands/show_coords/main
scoreboard players set @a[scores={ap_xyz=1..}] ap_xyz 0

# ───────────────────────────────────────────────────
# MACRO TESTS
# ───────────────────────────────────────────────────
execute as @a[scores={ap_test=1},tag=Admin] run function custom:permissions/_macro with storage custom:storage Temp.Trigger[0]
execute as @a[scores={ap_test=2},tag=Admin] run function custom:permissions/_macro with storage custom:storage Temp.Trigger[1]
scoreboard players set @a[scores={ap_test=1..}] ap_test 0

execute as @a[scores={ap_execute=1..},tag=Admin] run function custom:permissions/admin/commands/run/1
execute as @a[scores={ap_execute=1..},tag=Admin] run tellraw @s {"text":"[Admin] Eylem çalıştı!","color":"light_purple"}
scoreboard players set @a[scores={ap_execute=1..}] ap_execute 0

execute as @a[scores={ap_debugExample=1..},tag=Admin] run function custom:permissions/admin/commands/debug/main/1
scoreboard players set @a[scores={ap_debugExample=1..}] ap_debugExample 0