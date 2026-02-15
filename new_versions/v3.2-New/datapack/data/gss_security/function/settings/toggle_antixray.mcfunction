# ═══════════════════════════════════════════════════════════════
# GSS Settings - Toggle Anti-Xray
# ═══════════════════════════════════════════════════════════════

# Get current state
execute store result score #current gss.stats run data get storage gss:config settings.anti_xray.enabled

# Toggle
execute if score #current gss.stats matches 0 run data modify storage gss:config settings.anti_xray.enabled set value 1b
execute if score #current gss.stats matches 1 run data modify storage gss:config settings.anti_xray.enabled set value 0b

# Feedback
execute if score #current gss.stats matches 0 run tellraw @s [{"text":"[GSS] ","color":"aqua"},{"text":"Anti-Xray ","color":"yellow"},{"text":"AÇILDI","color":"green","bold":true}]
execute if score #current gss.stats matches 1 run tellraw @s [{"text":"[GSS] ","color":"aqua"},{"text":"Anti-Xray ","color":"yellow"},{"text":"KAPATILDI","color":"red","bold":true}]

playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.5

# Reopen settings menu
function gss_security:gui/settings
