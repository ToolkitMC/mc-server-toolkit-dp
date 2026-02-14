# Kontrol Et
$execute as @s[tag=!$(tag)] run return run tellraw @s {"text":"Üzgünüm, bu komut için yetkin yok!","color":"red"}

# Komut Çalıştır
$execute as @p[limit=1,sort=arbitrary,tag=$(tag)] at @s positioned ~ ~ ~ rotated as @s if score @s $(score) matches $(number) run $(command)

# Skor'u Sıfırla
$scoreboard players set @a $(score) 0

# Trigger Etkinleştir
$scoreboard players enable @a[tag=$(tag)] $(score)

execute at @s run return 1