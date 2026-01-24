# === MAIN LOAD DISPATCHER ===

# Custom Admin init
function custom_admin:load
function custom_admin:handler/load/1

# GLc Menu init
function glc_menu:handler/load

# CD İnit
function cooldown:init

# load tamam flag
scoreboard objectives add gulceos.const dummy
scoreboard players set #loaded gulceos.const 1

data modify storage custom:storage Temp.Trigger[0] set value {"execute":"say ✅","number":1,"score":"ap_test","player":"@s"}
data modify storage custom:storage Temp.Trigger[1] set value {"execute":"say ❌","number":2,"score":"ap_test","player":"@s"}