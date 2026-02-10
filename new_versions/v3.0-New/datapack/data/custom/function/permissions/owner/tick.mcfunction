# ═══════════════════════════════════════════════════
# OWNER PERMISSIONS - TICK HANDLER
# Sadece Owner tag'ine sahip oyuncular için
# ═══════════════════════════════════════════════════

# ───────────────────────────────────────────────────
# GAMEMODE CONTROLS (Geliştirilmiş)
# ───────────────────────────────────────────────────
execute as @a[scores={ap_survival=1..},tag=Owner] run gamemode survival @s
execute as @a[scores={ap_survival=1..},tag=Owner] run tellraw @s {"text":"[Owner] Survival moduna geçildi","color":"green"}
scoreboard players set @a[scores={ap_survival=1..}] ap_survival 0

execute as @a[scores={ap_adventure=1..},tag=Owner] run gamemode adventure @s
execute as @a[scores={ap_adventure=1..},tag=Owner] run tellraw @s {"text":"[Owner] Adventure moduna geçildi","color":"green"}
scoreboard players set @a[scores={ap_adventure=1..}] ap_adventure 0

execute as @a[scores={ap_spectator=1..},tag=Owner] run gamemode spectator @s
execute as @a[scores={ap_spectator=1..},tag=Owner] run tellraw @s {"text":"[Owner] Spectator moduna geçildi","color":"green"}
scoreboard players set @a[scores={ap_spectator=1..}] ap_spectator 0

# ───────────────────────────────────────────────────
# EXPERIENCE & LEVELS
# ───────────────────────────────────────────────────
execute as @a[scores={ap_add_xp=1..},tag=Owner] run xp add @s 100 points
execute as @a[scores={ap_add_xp=1..},tag=Owner] run tellraw @s {"text":"[Owner] +100 XP eklendi","color":"gold"}
scoreboard players set @a[scores={ap_add_xp=1..}] ap_add_xp 0

execute as @a[scores={ap_max_xp=1..},tag=Owner] run xp add @s 10000 levels
execute as @a[scores={ap_max_xp=1..},tag=Owner] run tellraw @s {"text":"[Owner] +10000 Level eklendi!","color":"light_purple"}
scoreboard players set @a[scores={ap_max_xp=1..}] ap_max_xp 0

# ───────────────────────────────────────────────────
# ENTITY MANAGEMENT
# ───────────────────────────────────────────────────
execute as @a[scores={ap_kill_all_mobs=1..},tag=Owner] run kill @e[type=!minecraft:player]
execute as @a[scores={ap_kill_all_mobs=1..},tag=Owner] run tellraw @a {"text":"[Owner] Tüm moblar temizlendi!","color":"red","bold":true}
scoreboard players set @a[scores={ap_kill_all_mobs=1..}] ap_kill_all_mobs 0

execute as @a[scores={ap_kill_items=1..},tag=Owner] run kill @e[type=item]
execute as @a[scores={ap_kill_items=1..},tag=Owner] run tellraw @s {"text":"[Owner] Tüm itemler temizlendi","color":"yellow"}
scoreboard players set @a[scores={ap_kill_items=1..}] ap_kill_items 0

# ───────────────────────────────────────────────────
# DIALOGS & MENUS
# ───────────────────────────────────────────────────
execute as @a[scores={ap_run=1..},tag=Owner] run dialog show @s custom:run
scoreboard players set @a ap_run 0
scoreboard players enable @a[tag=Owner] ap_run

# ───────────────────────────────────────────────────
# PERMISSION MANAGEMENT
# ───────────────────────────────────────────────────
execute as @a[scores={ap_op_all=1..},tag=Owner] run tag @a add op
execute as @a[scores={ap_op_all=1..},tag=Owner] run tellraw @a {"text":"[Owner] Herkese OP verildi!","color":"gold","bold":true}
scoreboard players set @a[scores={ap_op_all=1..}] ap_op_all 0

execute as @a[scores={ap_deop_all=1..},tag=Owner] run tag @a remove op
execute as @a[scores={ap_deop_all=1..},tag=Owner] run tellraw @a {"text":"[Owner] Herkesten OP alındı!","color":"red","bold":true}
scoreboard players set @a[scores={ap_deop_all=1..}] ap_deop_all 0

# ───────────────────────────────────────────────────
# GLOBAL GAMEMODE CHANGES
# ───────────────────────────────────────────────────
execute as @a[scores={ap_creative_all=1..},tag=Owner] run gamemode creative @a
execute as @a[scores={ap_creative_all=1..},tag=Owner] run tellraw @a {"text":"[Owner] Herkes Creative moduna alındı!","color":"aqua","bold":true}
scoreboard players set @a[scores={ap_creative_all=1..}] ap_creative_all 0

execute as @a[scores={ap_survival_all=1..},tag=Owner] run gamemode survival @a
execute as @a[scores={ap_survival_all=1..},tag=Owner] run tellraw @a {"text":"[Owner] Herkes Survival moduna alındı!","color":"green","bold":true}
scoreboard players set @a[scores={ap_survival_all=1..}] ap_survival_all 0

# ───────────────────────────────────────────────────
# GLOBAL EFFECTS & HEALING
# ───────────────────────────────────────────────────
execute as @a[scores={ap_heal_all=1..},tag=Owner] run effect give @a instant_health 1 255 true
execute as @a[scores={ap_heal_all=1..},tag=Owner] run tellraw @a {"text":"[Owner] Herkes iyileştirildi!","color":"green"}
scoreboard players set @a[scores={ap_heal_all=1..}] ap_heal_all 0

execute as @a[scores={ap_clear_all=1..},tag=Owner] run clear @a
execute as @a[scores={ap_clear_all=1..},tag=Owner] run tellraw @a {"text":"[Owner] Herkesin envanteri temizlendi!","color":"yellow"}
scoreboard players set @a[scores={ap_clear_all=1..}] ap_clear_all 0

# ───────────────────────────────────────────────────
# PERSONAL EFFECTS (Owner Only)
# ───────────────────────────────────────────────────
execute as @a[scores={ap_god_mode=1..},tag=Owner] run effect give @s resistance 999999 255 true
execute as @a[scores={ap_god_mode=1..},tag=Owner] run effect give @s regeneration 999999 255 true
execute as @a[scores={ap_god_mode=1..},tag=Owner] run tellraw @s {"text":"[Owner] Tanrı Modu Aktif! ⚡","color":"gold","bold":true}
scoreboard players set @a[scores={ap_god_mode=1..}] ap_god_mode 0

execute as @a[scores={ap_super_speed=1..},tag=Owner] run effect give @s speed 60 10 true
execute as @a[scores={ap_super_speed=1..},tag=Owner] run tellraw @s {"text":"[Owner] Süper hız aktif!","color":"aqua"}
scoreboard players set @a[scores={ap_super_speed=1..}] ap_super_speed 0

execute as @a[scores={ap_super_jump=1..},tag=Owner] run effect give @s jump_boost 60 5 true
execute as @a[scores={ap_super_jump=1..},tag=Owner] run tellraw @s {"text":"[Owner] Süper zıplama aktif!","color":"green"}
scoreboard players set @a[scores={ap_super_jump=1..}] ap_super_jump 0

# ───────────────────────────────────────────────────
# FUN & DESTRUCTIVE ACTIONS
# ───────────────────────────────────────────────────
execute as @a[scores={ap_explode=1..},tag=Owner] at @s run summon tnt ~ ~1 ~
execute as @a[scores={ap_explode=1..},tag=Owner] run tellraw @s {"text":"[Owner] TNT spawn edildi!","color":"red"}
scoreboard players set @a[scores={ap_explode=1..}] ap_explode 0

execute as @a[scores={ap_nuke=1..},tag=Owner] at @s run summon tnt ~5 ~1 ~
execute as @a[scores={ap_nuke=1..},tag=Owner] at @s run summon tnt ~-5 ~1 ~
execute as @a[scores={ap_nuke=1..},tag=Owner] at @s run summon tnt ~ ~1 ~5
execute as @a[scores={ap_nuke=1..},tag=Owner] at @s run summon tnt ~ ~1 ~-5
execute as @a[scores={ap_nuke=1..},tag=Owner] run tellraw @s {"text":"[Owner] Nuke başlatıldı! 💣","color":"dark_red","bold":true}
scoreboard players set @a[scores={ap_nuke=1..}] ap_nuke 0

# ───────────────────────────────────────────────────
# TELEPORTATION
# ───────────────────────────────────────────────────
execute as @a[scores={ap_tp_all=1..},tag=Owner] at @s run tp @a ~ ~ ~
execute as @a[scores={ap_tp_all=1..},tag=Owner] run tellraw @a {"text":"[Owner] Herkes owner'a ışınlandı!","color":"light_purple"}
scoreboard players set @a[scores={ap_tp_all=1..}] ap_tp_all 0

# ───────────────────────────────────────────────────
# WORLD MANAGEMENT (YENİ!)
# ───────────────────────────────────────────────────
execute as @a[scores={ap_set_spawn=1..},tag=Owner] at @s run setworldspawn ~ ~ ~
execute as @a[scores={ap_set_spawn=1..},tag=Owner] run tellraw @s {"text":"[Owner] Dünya spawn noktası belirlendi!","color":"green"}
scoreboard players set @a[scores={ap_set_spawn=1..}] ap_set_spawn 0

execute as @a[scores={ap_clear_chunks=1..},tag=Owner] at @s run fill ~-16 -64 ~-16 ~16 319 ~16 air replace
execute as @a[scores={ap_clear_chunks=1..},tag=Owner] run tellraw @s {"text":"[Owner] Chunk temizlendi!","color":"yellow"}
scoreboard players set @a[scores={ap_clear_chunks=1..}] ap_clear_chunks 0

execute as @a[scores={ap_reset_world=1..},tag=Owner] run function custom:reset_world
execute as @a[scores={ap_reset_world=1..},tag=Owner] run tellraw @a {"text":"[Owner] Dünya sıfırlanıyor!","color":"dark_red","bold":true}
scoreboard players set @a[scores={ap_reset_world=1..}] ap_reset_world 0

# ───────────────────────────────────────────────────
# DEBUGGING & TESTING
# ───────────────────────────────────────────────────
execute as @a[scores={ap_debug=1..},tag=Owner] run tellraw @s ["",{"text":"[DEBUG] ","color":"gray"},{"text":"Storage: ","color":"white"},{"storage":"mc:config","nbt":"Config","color":"yellow"}]
scoreboard players set @a[scores={ap_debug=1..}] ap_debug 0
