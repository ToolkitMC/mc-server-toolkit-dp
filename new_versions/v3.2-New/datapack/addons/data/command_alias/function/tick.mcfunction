# ============================================
# Command Alias System - Main Tick
# ============================================

# Enable trigger for all players
scoreboard players enable @a ca.trigger
scoreboard players enable @a ca.menu

# Cooldown countdown
scoreboard players remove @a[scores={ca.cooldown=1..}] ca.cooldown 1

# Detect trigger usage
execute as @a[scores={ca.trigger=1..}] run function command_alias:trigger/detect
execute as @a[scores={ca.menu=1..}] run function command_alias:trigger/detect


# Detect clicks
execute as @a[scores={ca.use=1..}] as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{CA:{Clickable:1b}}}}}] run function command_alias:execute/macro with entity @s SelectedItem.components."minecraft:custom_data".CA
execute as @a[scores={ca.use=1..}] as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{CA:{Clickable:1b}}}}}] run function command_alias:execute/debug with entity @s SelectedItem.components."minecraft:custom_data".CA
scoreboard players set @a[scores={ca.use=1..}] ca.use 0

# The system detects when a player drops an item and immediately returns it.
execute as @e[type=item] if items entity @s contents minecraft:carrot_on_a_stick[minecraft:custom_data~{CA:{Clickable:1b}}] at @s on origin run data merge entity @n[type=item,distance=..0.1] {PickupDelay:0s}