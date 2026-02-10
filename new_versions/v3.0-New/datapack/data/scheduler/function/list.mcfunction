# Tüm aktif zamanlayıcıları listele

tellraw @s [{"text":"=== AKTİF ZAMANLANMIŞ GÖREVLER ===","color":"gold","bold":true}]

execute as @e[type=marker,tag=scheduler] if score @s sch.active matches 1 run tellraw @a [{"text":"[ID: ","color":"yellow"},{"score":{"name":"@s","objective":"sch.id"}},{"text":"] "},{"text":"Kalan: ","color":"aqua"},{"score":{"name":"@s","objective":"sch.time"},"color":"green"},{"text":" tick","color":"white"}]

tellraw @s [{"text":"================================","color":"gold","bold":true}]
