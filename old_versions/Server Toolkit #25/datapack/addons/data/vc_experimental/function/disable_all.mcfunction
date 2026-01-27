# Adım 1:
function main:stop

# Adım 2:
scoreboard objectives remove permission_level
scoreboard objectives remove gulceos.const
scoreboard objectives remove global
scoreboard objectives remove ap_test
scoreboard objectives remove ap_ban
scoreboard objectives remove ap_clear
scoreboard objectives remove ap_xyz
scoreboard objectives remove ap_godarmor
scoreboard objectives remove ap_permissions
scoreboard objectives remove cd.active
scoreboard objectives remove cd.timer
scoreboard objectives remove cd.duration
scoreboard objectives remove coords_x
scoreboard objectives remove coords_y
scoreboard objectives remove coords_z
data remove storage custom:storage Log
data remove storage custom:storage Data
data remove storage custom:storage Starter

# Adım 3:
datapack disable "file/datapack.zip"