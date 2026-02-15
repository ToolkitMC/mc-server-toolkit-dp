tellraw @s [{"text":"[GulceOS]","color":"green"}," ",{"text":"Hazırlanıyor...","color":"gray"}]
$data merge storage custom:storage {"Player":"$(Name)"}

execute unless entity @s[tag=Admin] run tellraw @s [{"text":"[GulceOS]","color":"green"}," ",{"text":"Yetkin Yok!","color":"red"}]
execute unless entity @s[tag=Admin] run return 0

execute if entity @s[tag=Admin] run tellraw @s [{"text":"[GulceOS]","color":"green"}," ",{"text":"Yükleniyor...","color":"gray"}]
execute if entity @s[tag=Admin,gamemode=creative] run function custom:permissions/player/init

execute if entity @s[tag=Admin] run tellraw @s [{"text":"[GulceOS]","color":"green"}," ",{"text":"Devam Ediyor...","color":"gray"}]
execute if entity @s[tag=Admin] run data remove storage custom:storage Player

execute if entity @s[tag=Admin] run tellraw @s [{"text":"[GulceOS]","color":"green"}," ",{"text":"Başarılı!","color":"green"}]