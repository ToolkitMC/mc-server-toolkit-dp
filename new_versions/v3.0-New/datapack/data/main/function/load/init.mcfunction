# === MAIN LOAD DISPATCHER ===
scoreboard objectives add gulceos.const dummy

# Custom Admin init
function custom_admin:load
function custom_admin:handler/load/1

# GLc Menu init
function glc_menu:handler/load

# CD İnit
function cooldown:init

# Command Alias init
function command_alias:init

# load tamam flag
scoreboard players set #loaded gulceos.const 1

# Test izni
data modify storage custom:storage Temp.Trigger set value []
data modify storage custom:storage Temp.Trigger append value {"command":"say ✅","number":1,"score":"ap_test","tag":"op"}
data modify storage custom:storage Temp.Trigger append value {"command":"say ❌","number":2,"score":"ap_test","tag":"op"}

# Menü açıcı #1
scoreboard objectives add mcst.menu minecraft.used:minecraft.carrot_on_a_stick