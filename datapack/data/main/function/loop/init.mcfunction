# ─────────────────────────────
# TICK GUARD (ZORUNLU)
# ─────────────────────────────

# Oyuncu yoksa TICK DURUR
execute unless entity @a run return 1


# ─────────────────────────────
# GUI SİSTEMİ
# ─────────────────────────────

execute if score #glc_menu_active global matches 1 run function glc_menu:handler/tick


# ─────────────────────────────
# ADMIN SİSTEMİ
# ─────────────────────────────

execute if score #admin_loop global matches 1 run function custom_admin:handler/loop/all/1


# ─────────────────────────────
# GLOBAL İŞLER
# ─────────────────────────────

execute if score #global_tick global matches 1 run function global:tick


# ─────────────────────────────
# COOLDOWN
# ─────────────────────────────

execute if score #cooldown_active global matches 1 run function cooldown:loop

# ─────────────────────────────
# ANA İŞLER
# ─────────────────────────────

execute if score #main global matches 1 run function gulce_adminpower_addons:loop
