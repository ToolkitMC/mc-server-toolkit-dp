# Görev zamanı doldu - komutu çalıştır

# Marker'dan data'yı storage'a kopyala
data modify storage scheduler:temp command set from entity @s data.command
data modify storage scheduler:temp player set from entity @s data.player

# Komutu çalıştır
function scheduler:run_from_storage with storage scheduler:temp

# Marker'ı temizle
scoreboard players set @s sch.active 0
kill @s
