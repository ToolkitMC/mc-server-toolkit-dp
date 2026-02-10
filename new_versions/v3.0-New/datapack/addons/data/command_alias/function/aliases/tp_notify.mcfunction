# ============================================
# Alias: TP with Notify
# ============================================
# Trigger ID: 3
# Cooldown: 45 seconds
# Permission: admin

# Check permission
execute unless predicate adminpower_predicates:gulceos_permissions run return run tellraw @s {"text":"❌ Bu komutu kullanma yetkiniz yok!","color":"red"}

# Check cooldown
execute unless function command_alias:cooldown/check run return 0

# Execute commands
tp @s ~ ~1 ~
title @s actionbar {"text":"✈ Işınlandınız!","color":"aqua"}
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1

# Particle effect
particle minecraft:portal ~ ~1 ~ 0.5 1 0.5 0.5 50

# Start cooldown
function command_alias:cooldown/start {seconds:45}
