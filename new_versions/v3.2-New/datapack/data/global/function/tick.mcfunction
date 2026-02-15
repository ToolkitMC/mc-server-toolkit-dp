# ═══════════════════════════════════════════════════
# GLOBAL TICK (SCHEDULED)
# Runs every 3 ticks instead of every tick
# ═══════════════════════════════════════════════════

# Flag kontrolü: Sistem aktif mi?
execute unless score #global_tick global matches 1 run return 0

# Oyuncu kontrolü: Oyuncu yoksa çalışma
execute unless entity @a run return 0

# Ana işler (orjinal kodlar)
advancement revoke @a from global:items/clickable/admin_tool
execute as @e[type=item,distance=..32,limit=20] if items entity @s contents *[minecraft:custom_data~{ConfigUI:1b}] at @s on origin run data merge entity @n[type=item,distance=..0.1] {PickupDelay:0s}
execute unless predicate actions:can_use_panel run clear @a[tag=!op] *[minecraft:custom_data={ConfigUI:1b}]

# GSS Security Suite tick
execute if data storage mc:config {Config:{Enabled:1b}} run function gss_security:core/tick

# Command Alias tick
function command_alias:tick
