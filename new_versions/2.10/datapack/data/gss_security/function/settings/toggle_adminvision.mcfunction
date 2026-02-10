# ═══════════════════════════════════════════════════════════════
# GSS Settings - Toggle Admin Vision System
# ═══════════════════════════════════════════════════════════════

execute store result score #current gss.stats run data get storage gss:config settings.admin_vision.enabled

execute if score #current gss.stats matches 0 run data modify storage gss:config settings.admin_vision.enabled set value 1b
execute if score #current gss.stats matches 1 run data modify storage gss:config settings.admin_vision.enabled set value 0b

execute if score #current gss.stats matches 0 run tellraw @s [{"text":"[GSS] ","color":"aqua"},{"text":"Admin Vision Sistemi ","color":"yellow"},{"text":"AÇILDI","color":"green","bold":true}]
execute if score #current gss.stats matches 1 run tellraw @s [{"text":"[GSS] ","color":"aqua"},{"text":"Admin Vision Sistemi ","color":"yellow"},{"text":"KAPATILDI","color":"red","bold":true}]

playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.5
function gss_security:gui/settings
