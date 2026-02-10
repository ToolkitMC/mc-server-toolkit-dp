# Yeni zamanlayıcı görevi ekle
# Kullanım: /function scheduler:add {time:100,command:"say Merhaba",player:"@s"}

# Yeni marker oluştur
summon marker ~ ~ ~ {Tags:["scheduler","sch.new"]}

# Marker'a değerleri ata
$scoreboard players set @e[type=marker,tag=sch.new,limit=1] sch.time $(time)
scoreboard players operation @e[type=marker,tag=sch.new,limit=1] sch.id = $next_id sch.id
scoreboard players set @e[type=marker,tag=sch.new,limit=1] sch.active 1

# Komutu ve oyuncuyu data'ya kaydet
$data modify entity @e[type=marker,tag=sch.new,limit=1] data.command set value "$(command)"
$data modify entity @e[type=marker,tag=sch.new,limit=1] data.player set value "$(player)"

# ID'yi artır
scoreboard players add $next_id sch.id 1

# Tag'i kaldır
tag @e[type=marker,tag=sch.new] remove sch.new

# Onay mesajı
tellraw @a [{"text":"[SCHEDULER] ","color":"gold","bold":true},{"text":"Görev zamanlandı!","color":"green"}]
