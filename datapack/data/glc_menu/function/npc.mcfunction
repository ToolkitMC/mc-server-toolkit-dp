summon minecraft:interaction ~ ~ ~ {Tags:["_glcMenu"],width:1f,height:2f,response:1}
summon villager ~ ~ ~ {VillagerData:{profession:"minecraft:librarian",level:5,type:"minecraft:plains"},CustomName:{"text":"§aAdmin NPC","color":"green","bold":true},NoAI:1b,Invulnerable:1b,Silent:1b,Tags:["_glcMenu"]}
execute as @e[type=villager,tag=_glcMenu] run data modify entity @s ArmorItems set value [{},{},{},{id:"golden_apple",Count:1b}]
tellraw @a {"text":"§a§lNPC SPAWN! Sağ tıkla panel aç.","bold":true}