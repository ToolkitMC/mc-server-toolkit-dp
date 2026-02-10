# ─────────────────────────────
# TICK GUARD (ZORUNLU)
# ─────────────────────────────

# Oyuncu yoksa TICK DURUR
execute unless entity @a run return 1


# ─────────────────────────────
# GUI SİSTEMİ (Her Tick)
# ─────────────────────────────

execute if score #glc_menu_active global matches 1 run function glc_menu:handler/tick


# ─────────────────────────────
# ADMIN SİSTEMİ (Schedule - 2 tick)
# ─────────────────────────────

execute if score #admin_loop global matches 1 run function custom_admin:handler/loop/all/1


# ─────────────────────────────
# GLOBAL İŞLER (Schedule - 3 tick)
# ─────────────────────────────

execute if score #global_tick global matches 1 run function global:tick


# ─────────────────────────────
# COOLDOWN (Her Tick - Kritik)
# ─────────────────────────────

execute if score #cooldown_active global matches 1 run function cooldown:loop


# ─────────────────────────────
# ANA İŞLER / ADDONS
# ─────────────────────────────

execute if score #main global matches 1 run function gulce_adminpower_addons:loop

# Menü açıcı #1
execute as @a[scores={mcst.menu=1..}] as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{ServerToolkit:{glcMenu:1b}}}}}] run function glc_menu:handler/builder/main
scoreboard players set @a[scores={mcst.menu=1..}] mcst.menu 0