# ═══════════════════════════════════════════════════
# GULCE Admin Power - Main Tick Loop (SCHEDULED)
# Runs every 2 ticks instead of every tick
# ═══════════════════════════════════════════════════

# Flag kontrolü: Sistem aktif mi?
execute unless score #admin_loop global matches 1 run return 0

# Oyuncu kontrolü: Oyuncu yoksa çalışma
execute unless entity @a run return 0

# Trigger kontrolü
execute as @a[scores={gulce_trigger=1..}] run function custom_admin:run/trigger

# Ana döngüleri çalıştır
function custom_admin:handler/loop/main
function custom_admin:handler/loop/permissions
function custom_admin:group/check

# ─────────────────────────────
# SELF-RESCHEDULE (ÖNEMLİ!)
# ─────────────────────────────
execute if data storage mc:config {Config:{Enabled:1b}} if score #admin_loop global matches 1 run schedule function custom_admin:handler/loop/all/1 2t replace
