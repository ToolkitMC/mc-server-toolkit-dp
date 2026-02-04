# ═══════════════════════════════════════════════════════════════
# GSS Settings - Toggle Auto-Freeze
# ═══════════════════════════════════════════════════════════════

execute store result score #current gss.stats run data get storage gss:config settings.anti_xray.auto_freeze

execute if score #current gss.stats matches 0 run data modify storage gss:config settings.anti_xray.auto_freeze set value 1b
execute if score #current gss.stats matches 1 run data modify storage gss:config settings.anti_xray.auto_freeze set value 0b

execute if score #current gss.stats matches 0 run tellraw @s [{"text":"[GSS] ","color":"aqua"},{"text":"Otomatik Freeze ","color":"yellow"},{"text":"AÇILDI","color":"green","bold":true},{"text":" - Şüpheli oyuncular donacak!","color":"gray"}]
execute if score #current gss.stats matches 1 run tellraw @s [{"text":"[GSS] ","color":"aqua"},{"text":"Otomatik Freeze ","color":"yellow"},{"text":"KAPATILDI","color":"red","bold":true},{"text":" - Sadece uyarı gosterilecek","color":"gray"}]

playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.5
function gss_security:gui/settings
