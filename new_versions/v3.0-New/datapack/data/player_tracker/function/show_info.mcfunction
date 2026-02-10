# Belirli bir oyuncunun bilgilerini göster
# Kullanım: /function player_tracker:show_info {player:"oyuncu_adi"}

tellraw @a [{"text":"=== OYUNCU BİLGİLERİ ===","color":"gold","bold":true}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"İsim: ","color":"aqua"},{"selector":"@s","color":"yellow"}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"ID: ","color":"aqua"},{"score":{"name":"@s","objective":"ply.id"},"color":"yellow"}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"Konum: ","color":"aqua"},{"nbt":"Pos","entity":"@s","color":"yellow"}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"Sağlık: ","color":"aqua"},{"nbt":"Health","entity":"@s","color":"red"}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"Oyun Modu: ","color":"aqua"},{"nbt":"playerGameType","entity":"@s","color":"green"}]
tellraw @a [{"text":"=======================","color":"gold","bold":true}]
