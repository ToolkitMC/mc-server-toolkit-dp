# ============================================
# Alias: Event Preparation
# ============================================
# Trigger ID: 5
# Cooldown: 300 seconds (5 minutes)
# Permission: owner

# Check permission (owner only)
execute unless predicate adminpower_predicates:part_1 run return run tellraw @s {"text":"❌ Bu komutu sadece owner kullanabilir!","color":"red"}

# Check cooldown
execute unless function command_alias:cooldown/check run return 0

# Execute commands
weather clear
time set day
tp @a 0 100 0
title @a title {"text":"EVENT BAŞLIYOR!","color":"gold","bold":true}
title @a subtitle {"text":"Hazır olun!","color":"yellow"}
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1

# Announce
tellraw @a ["",{"text":"═══════════════════════","color":"gold","bold":true},"\n",{"text":"🎉 EVENT BAŞLIYOR! 🎉","color":"yellow","bold":true},"\n",{"text":"═══════════════════════","color":"gold","bold":true}]

# Start cooldown
function command_alias:cooldown/start {seconds:300}
