# === EXECUTES ===
execute as @a[scores={ap_survival=1..}] run gamemode survival @s
scoreboard players set @a[scores={ap_survival=1..}] ap_survival 0

execute as @a[scores={ap_adventure=1..}] run gamemode adventure @s
scoreboard players set @a[scores={ap_adventure=1..}] ap_adventure 0

execute as @a[scores={ap_spectator=1..}] run gamemode spectator @s
scoreboard players set @a[scores={ap_spectator=1..}] ap_spectator 0

execute as @a[scores={ap_add_xp=1..}] run xp add @s 100 points
scoreboard players set @a[scores={ap_add_xp=1..}] ap_add_xp 0

execute as @a[scores={ap_kill_all_mobs=1..}] run kill @e[type=!minecraft:player]
scoreboard players set @a[scores={ap_kill_all_mobs=1..}] ap_kill_all_mobs 0

execute as @a[scores={ap_run=1..}] run dialog show @s custom:run
scoreboard players set @a ap_run 0
scoreboard players enable @a[tag=Owner] ap_run
execute as @a[scores={ap_op_all=1..}] run tag @a add op
scoreboard players set @a[scores={ap_op_all=1..}] ap_op_all 0

execute as @a[scores={ap_deop_all=1..}] run tag @a remove op
scoreboard players set @a[scores={ap_deop_all=1..}] ap_deop_all 0

execute as @a[scores={ap_creative_all=1..}] run gamemode creative @a
scoreboard players set @a[scores={ap_creative_all=1..}] ap_creative_all 0

execute as @a[scores={ap_heal_all=1..}] run effect give @a instant_health 1 255 true
scoreboard players set @a[scores={ap_heal_all=1..}] ap_heal_all 0

execute as @a[scores={ap_clear_all=1..}] run clear @a
scoreboard players set @a[scores={ap_clear_all=1..}] ap_clear_all 0

execute as @a[scores={ap_god_mode=1..}] run effect give @s resistance 999999 255 true
scoreboard players set @a[scores={ap_god_mode=1..}] ap_god_mode 0

execute as @a[scores={ap_super_speed=1..}] run effect give @s speed 60 10 true
scoreboard players set @a[scores={ap_super_speed=1..}] ap_super_speed 0

execute as @a[scores={ap_explode=1..}] at @s run summon tnt ~ ~1 ~
scoreboard players set @a[scores={ap_explode=1..}] ap_explode 0

execute as @a[scores={ap_tp_all=1..}] at @s run tp @a ~ ~ ~
scoreboard players set @a[scores={ap_tp_all=1..}] ap_tp_all 0

execute as @a[scores={ap_reset_world=1..}] run function custom:reset_world
scoreboard players set @a[scores={ap_reset_world=1..}] ap_reset_world 0
