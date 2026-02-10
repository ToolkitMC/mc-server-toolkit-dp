# ═══════════════════════════════════════════════════
# GULCE Admin Power - Main Tick Loop
# ═══════════════════════════════════════════════════

# Timer kontrolü
function custom_admin:handler/timer

# Cooldown azaltma
execute as @a[limit=1,sort=arbitrary,scores={gulce_cooldown=1..}] at @s run scoreboard players remove @s gulce_cooldown 1

# Zamanlıyıcı Sistemi
function custom_admin:schedule/tick