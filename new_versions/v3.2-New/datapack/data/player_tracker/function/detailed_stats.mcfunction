# Oyuncu istatistiklerini detaylı göster

tellraw @a [{"text":"\n=== DETAYLI OYUNCU İSTATİSTİKLERİ ===","color":"gold","bold":true}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"👤 Oyuncu: ","color":"aqua"},{"selector":"@s","color":"yellow","bold":true}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"🆔 Sistem ID: ","color":"aqua"},{"score":{"name":"@s","objective":"ply.id"},"color":"yellow"}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"📍 X: ","color":"aqua"},{"nbt":"Pos[0]","entity":"@s","color":"green"},{"text":" Y: ","color":"aqua"},{"nbt":"Pos[1]","entity":"@s","color":"green"},{"text":" Z: ","color":"aqua"},{"nbt":"Pos[2]","entity":"@s","color":"green"}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"❤️ Sağlık: ","color":"aqua"},{"nbt":"Health","entity":"@s","color":"red"},{"text":"/20","color":"dark_red"}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"🍗 Açlık: ","color":"aqua"},{"nbt":"foodLevel","entity":"@s","color":"gold"},{"text":"/20","color":"yellow"}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"🎮 Oyun Modu: ","color":"aqua"},{"nbt":"playerGameType","entity":"@s","color":"green"}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"⭐ XP Seviye: ","color":"aqua"},{"nbt":"XpLevel","entity":"@s","color":"light_purple"}]
$execute as @a[name="$(player)"] run tellraw @a [{"text":"🌍 Boyut: ","color":"aqua"},{"nbt":"Dimension","entity":"@s","color":"blue"}]
tellraw @a [{"text":"=====================================\n","color":"gold","bold":true}]
