############################
# ServerToolkit | Run Gate #
############################
# 1️⃣ Elde item yoksa → çık
execute unless data entity @s SelectedItem run return fail
# 2️⃣ Item Name Tag değilse → çık
execute unless data entity @s SelectedItem{id:"minecraft:name_tag"} run return fail
# 3️⃣ ServerToolkit.run yoksa → çık
execute unless data entity @s SelectedItem.components."minecraft:custom_data".ServerToolkit.run run return fail
# Type geçersiz ise → çık
execute unless data entity @s SelectedItem.components."minecraft:custom_data".ServerToolkit.run{type:1} unless data entity @s SelectedItem.components."minecraft:custom_data".ServerToolkit.run{type:2} run return run tellraw @s {"text":"[ServerToolkit] Geçersiz tip!","color":"green"}
############################
# Type Routing (Macro-SAFE)#
############################
# Type = 1
execute if data entity @s SelectedItem.components."minecraft:custom_data".ServerToolkit.run{type:1} run function custom:permissions/admin/commands/run/type/1 with entity @s SelectedItem.components."minecraft:custom_data".ServerToolkit.run
# Type = 2
execute if data entity @s SelectedItem.components."minecraft:custom_data".ServerToolkit.run{type:2} run return run function custom:permissions/admin/commands/run/type/2 with entity @s SelectedItem.components."minecraft:custom_data".ServerToolkit.run
############################
# Debug / Log (Guaranteed) #
############################
tellraw @s {"text":"[ServerToolkit] Komut çalıştı.","color":"green","italic":false}