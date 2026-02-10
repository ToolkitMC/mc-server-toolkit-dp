# ============================================
# Start Cooldown (with macro)
# ============================================
# Usage: function command_alias:cooldown/start {seconds:30}

# Convert seconds to ticks (1 second = 20 ticks)
$scoreboard players set @s ca.cooldown $(seconds)
$scoreboard players operation @s ca.cooldown *= #20 ca.temp

# Set constant if not exists
execute unless score #20 ca.temp matches 20 run scoreboard players set #20 ca.temp 20
