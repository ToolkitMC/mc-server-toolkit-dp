scoreboard players enable @a[tag=op] ap_xyz

execute as @s store result score @s coords_x run data get entity @s Pos[0] 1
execute as @s store result score @s coords_y run data get entity @s Pos[1] 1
execute as @s store result score @s coords_z run data get entity @s Pos[2] 1

execute as @s run tellraw @s [  {"text":"Your Coordinates → ","color":"blue"},  {"text":"X: ","color":"aqua"},  {"score":{"name":"*","objective":"coords_x"},"color":"red"},  {"text":"  Y: ","color":"aqua"},  {"score":{"name":"*","objective":"coords_y"},"color":"red"},  {"text":"  Z: ","color":"aqua"},  {"score":{"name":"*","objective":"coords_z"},"color":"red"}]

scoreboard players reset @a[tag=op] ap_xyz
