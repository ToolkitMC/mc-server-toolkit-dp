# ═══════════════════════════════════════════════════════════════
# GSS Admin Vision - Toggle (FIXED)
# Proper toggle logic with tags to prevent race conditions
# ═══════════════════════════════════════════════════════════════

# Mark current state with temporary tags
tag @s[scores={gss.vision=0}] add gss.temp_off
tag @s[scores={gss.vision=1..}] add gss.temp_on

# Toggle the score based on tags
scoreboard players set @s[tag=gss.temp_off] gss.vision 1
scoreboard players set @s[tag=gss.temp_on] gss.vision 0

# Show feedback based on NEW state (after toggle)
execute if entity @s[tag=gss.temp_off] run function gss_security:admin_vision/feedback_on
execute if entity @s[tag=gss.temp_on] run function gss_security:admin_vision/feedback_off

# Cleanup tags
tag @s remove gss.temp_off
tag @s remove gss.temp_on

# Sound effect
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
