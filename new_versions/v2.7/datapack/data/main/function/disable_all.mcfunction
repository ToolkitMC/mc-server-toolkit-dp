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
scoreboard objectives remove glc_load_type
scoreboard objectives remove gulce_config
scoreboard objectives remove gss.stats
scoreboard objectives remove gss.xray
scoreboard objectives remove gss.trigger
scoreboard objectives remove gss.vision
scoreboard objectives remove ap_clear_all
scoreboard objectives remove ap_clear_chunks
scoreboard objectives remove ap_creative_all
scoreboard objectives remove ap_debug
scoreboard objectives remove ap_deop_all
scoreboard objectives remove ap_op_all
scoreboard objectives remove ap_explode
scoreboard objectives remove ap_firework
scoreboard objectives remove ap_fly
scoreboard objectives remove ap_freezeAll
scoreboard objectives remove ap_give_diamond
scoreboard objectives remove ap_god_mode
scoreboard objectives remove ap_heal_all
scoreboard objectives remove ap_hunger_fill
scoreboard objectives remove ap_invis
scoreboard objectives remove ap_kill_items
scoreboard objectives remove ap_kill_nearby
scoreboard objectives remove ap_lightning
scoreboard objectives remove ap_max_xp
scoreboard objectives remove ap_night_vision
scoreboard objectives remove ap_nuke
scoreboard objectives remove ap_reset_world
scoreboard objectives remove ap_set_spawn
scoreboard objectives remove ap_super_jump
scoreboard objectives remove ap_super_speed
scoreboard objectives remove ap_survival_all
scoreboard objectives remove ap_tp_all
scoreboard objectives remove ap_tp_spawn
scoreboard objectives remove ap_xp_boost
data remove storage glc:system loading
data remove storage glc:system NAME
data remove storage gss:temp raycast
data remove storage gss:zones data

# Adım 3:
playsound minecraft:block.anvil.land master @a ~ ~ ~ 1 0.5
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 0.8 0.5