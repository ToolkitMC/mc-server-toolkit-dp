# ============================================
# Alias: Creative Mode + Effects
# ============================================
# Trigger ID: 4
# Cooldown: 10 seconds
# Permission: admin

# Check permission
execute unless predicate adminpower_predicates:gulceos_permissions run return run tellraw @s {"text":"❌ Bu komutu kullanma yetkiniz yok!","color":"red"}

# Check cooldown
execute unless function command_alias:cooldown/check run return 0

# Execute commands
gamemode creative @s
effect give @s minecraft:night_vision 999999 0 true
effect give @s minecraft:speed 999999 1 true

# Visual feedback
title @s actionbar {"text":"⚡ Creative Mode + Efektler aktif!","color":"gold","bold":true}
playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 1 1.5

# Start cooldown
function command_alias:cooldown/start {seconds:10}
