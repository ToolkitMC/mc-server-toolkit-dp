# Debug Mesajı
$execute if score #global st_debug matches 1 run tellraw @s [{"text":"[DEBUG]","color":"aqua"},":"," ",{"text":"$(message)","color":"gray"}]