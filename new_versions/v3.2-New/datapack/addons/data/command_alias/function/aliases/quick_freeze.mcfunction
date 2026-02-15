# ============================================
# Alias: Quick Freeze Player
# ============================================
# Trigger ID: 6
# Cooldown: 15 seconds
# Permission: mod

# Check permission (mod or higher)
execute unless predicate adminpower_predicates:part_7 run return run tellraw @s {"text":"❌ Bu komutu kullanma yetkiniz yok!","color":"red"}

# Check cooldown
execute unless function command_alias:cooldown/check run return 0

# Execute commands
function custom:freeze_on
tellraw @a[tag=admin] ["",{"text":"⚠ Oyuncu donduruldu: ","color":"red"},{"selector":"@s"}]

# Visual feedback
title @s actionbar {"text":"❄ Freeze aktif!","color":"aqua"}
playsound minecraft:block.glass.break master @s ~ ~ ~ 1 0.5

# Start cooldown
function command_alias:cooldown/start {seconds:15}
