# Sadece OP çalıştırabilsin + el boş olsun
execute unless entity @s[tag=Admin] run tellraw @s {"text":"Bu komutu sadece OP kullanabilir!","color":"red"}
execute unless entity @s[tag=Admin] run return 0

tellraw @a {"text":"GulceOS güncelleniyor...","color":"gold","bold":true}

function gulceos:updater/activate {"version":"v30"}
