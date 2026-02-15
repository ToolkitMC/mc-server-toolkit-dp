# Oyuncu verilerini storage'a kaydet

# Oyuncu adını ve UUID'sini kaydet
execute store result storage player_tracker:data players[{id:0}].id int 1 run scoreboard players get @s ply.id
data modify storage player_tracker:data players[{id:0}].name set from entity @s CustomName
data modify storage player_tracker:data players[{id:0}].uuid set from entity @s UUID

# Konum bilgisi
execute store result storage player_tracker:data players[{id:0}].pos.x int 1 run data get entity @s Pos[0]
execute store result storage player_tracker:data players[{id:0}].pos.y int 1 run data get entity @s Pos[1]
execute store result storage player_tracker:data players[{id:0}].pos.z int 1 run data get entity @s Pos[2]
