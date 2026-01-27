# Cooldown kontrolü
execute if score @s gulce_cooldown matches 1.. run tellraw @s ["",{"text":"[GLC] ","color":"aqua","bold":true},{"text":"Lütfen bekleyin! Cooldown: ","color":"red"},{"score":{"name":"@s","objective":"gulce_cooldown"},"color":"yellow"},{"text":" tick","color":"red"}]
execute if score @s gulce_cooldown matches 1.. run scoreboard players set @s gulce_menu 0
execute if score @s gulce_cooldown matches 1.. run return 0
