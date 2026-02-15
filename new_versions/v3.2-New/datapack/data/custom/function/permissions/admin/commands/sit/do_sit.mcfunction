# ═══════════════════════════════════════════════════
# VIP - MOUNT
# VIP'ler için özel binek çağırma
# ═══════════════════════════════════════════════════

# Kullanım: /trigger ap_sit
execute if entity @s[nbt={OnGround:1b}] at @s run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Small:1b,Invisible:1b,ShowArms:1b,Invulnerable:1b,Tags:["ap.sitting_player"]}
execute if entity @s[nbt={OnGround:1b}] at @s run tp @e[tag=ap.sitting_player,limit=1,sort=nearest] @s
execute if entity @s[nbt={OnGround:1b}] at @s as @e[tag=ap.sitting_player,limit=1,sort=nearest] run tp @s ~ ~-.95 ~
execute if entity @s[nbt={OnGround:1b}] at @s positioned ~ ~-.95 ~ run ride @s mount @e[tag=ap.sitting_player,limit=1,sort=nearest]

scoreboard players reset @s sit

# Mesaj
tellraw @s ["",{"text":"[VIP] ","color":"light_purple","bold":true},{"text":"VIP Bineğin çağrıldı!","color":"aqua"}]

# Efekt
particle minecraft:end_rod ~ ~1 ~ 1 1 1 0.1 50 force
playsound minecraft:entity.horse.ambient master @s ~ ~ ~ 1 1