# Komut Çalıştır
$execute as @p[limit=1,sort=arbitrary] at @s positioned ~ ~ ~ rotated as @s if score @s $(score) matches $(number) run $(execute)

# Skor'u Sıfırla
$scoreboard players set @a $(score) 0

# Trigger Etkinleştir
$scoreboard players enable $(player) $(score)

execute at @s run return 1