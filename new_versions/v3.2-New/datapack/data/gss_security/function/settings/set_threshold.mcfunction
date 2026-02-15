# ═══════════════════════════════════════════════════════════════
# GSS Settings - Set Threshold
# Macro function to set suspicious threshold value
# ═══════════════════════════════════════════════════════════════
# Usage: /function gss_security:settings/set_threshold {value:100}

$data modify storage gss:config settings.anti_xray.suspicious_threshold set value $(value)

$tellraw @s [{"text":"[GSS] ","color":"aqua"},{"text":"Şüpheli Eşik ","color":"yellow"},{"text":"$(value)","color":"green","bold":true},{"text":" olarak ayarlandı","color":"gray"}]

playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
function gss_security:gui/settings
