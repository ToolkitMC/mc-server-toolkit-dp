# ============================================
# Detect which alias was triggered
# ============================================

# Store trigger value
scoreboard players operation @s ca.temp = @s ca.trigger

# Route to correct alias
execute if score @s ca.temp matches 1 run function command_alias:aliases/heal_feed
execute if score @s ca.temp matches 2 run function command_alias:aliases/clear_announce
execute if score @s ca.temp matches 3 run function command_alias:aliases/tp_notify
execute if score @s ca.temp matches 4 run function command_alias:aliases/gmc_effects
execute if score @s ca.temp matches 5 run function command_alias:aliases/event_prep
execute if score @s ca.temp matches 6 run function command_alias:aliases/quick_freeze
execute if score @s ca.temp matches 7 run function command_alias:aliases/mod_toolkit

# Reset trigger
scoreboard players reset @s ca.trigger
scoreboard players reset @s ca.temp
