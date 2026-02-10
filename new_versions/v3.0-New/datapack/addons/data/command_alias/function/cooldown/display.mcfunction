# ============================================
# Display Cooldown Remaining
# ============================================

# Calculate seconds remaining
scoreboard players operation @s ca.temp = @s ca.cooldown
scoreboard players operation @s ca.temp /= #20 ca.temp

# Display actionbar
title @s actionbar ["",{"text":"⏱ Cooldown: ","color":"red"},{"score":{"name":"@s","objective":"ca.temp"},"color":"yellow"},{"text":"s","color":"yellow"}]

# Play sound
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.5 0.5

# Return fail
return 0
