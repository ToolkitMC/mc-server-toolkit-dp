# Belirli ID'ye sahip görevi iptal et
# Kullanım: /function scheduler:cancel {id:1}

$execute as @e[type=marker,tag=scheduler] if score @s sch.id matches $(id) run scoreboard players set @s sch.active 0
$execute as @e[type=marker,tag=scheduler] if score @s sch.id matches $(id) run kill @s

tellraw @a [{"text":"[SCHEDULER] ","color":"gold","bold":true},{"text":"Görev iptal edildi!","color":"red"}]
