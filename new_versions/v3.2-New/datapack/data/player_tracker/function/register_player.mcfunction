# Yeni oyuncuyu sisteme kaydet

# Oyuncuya ID ver
scoreboard players operation @s ply.id = $next_player_id ply.id
scoreboard players add $next_player_id ply.id 1

# Oyuncu bilgilerini storage'a kaydet
function player_tracker:save_player_data

# Hoşgeldin mesajı
tellraw @s [{"text":"[SISTEM] ","color":"gold","bold":true},{"text":"Kayıt tamamlandı! ID: ","color":"green"},{"score":{"name":"@s","objective":"ply.id"},"color":"yellow"}]
