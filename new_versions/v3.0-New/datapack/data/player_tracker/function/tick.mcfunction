# Her tick oyuncuları takip et

# Yeni oyuncuları kaydet
execute as @a unless score @s ply.id matches 1.. run function player_tracker:register_player

# Online oyuncuları işaretle
scoreboard players set @a ply.online 1
