# ============================================
# Alias: Heal & Feed
# ============================================
# Trigger ID: 1
# Cooldown: 30 seconds
# Permission: admin

# Check permission
execute unless predicate adminpower_predicates:gulceos_permissions run return run tellraw @s {"text":"❌ Bu komutu kullanma yetkiniz yok!","color":"red"}

# Check cooldown
execute unless function command_alias:cooldown/check run return 0

# Execute commands
effect give @s minecraft:instant_health 1 10 true
effect give @s minecraft:saturation 1 10 true

# Visual feedback
title @s actionbar {"text":"❤ Heal & Feed aktif!","color":"green"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 1.5

# Start cooldown
function command_alias:cooldown/start {seconds:30}
