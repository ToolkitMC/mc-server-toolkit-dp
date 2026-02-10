# ─────────────────────────────
# GLOBAL STATE — INIT (PARAMETRELİ)
# ─────────────────────────────
# PARAMETRELER (SIRA ZORUNLU!) (Macro)
#
# $(glc_menu) → GUI SİSTEMİ
#        0 = Kapalı
#        1 = Açık
#
# $(admin_loop) → ADMIN LOOP
#        0 = Kapalı
#        1 = Açık
#
# $(tick) → GLOBAL TICK
#        0 = Kapalı
#        1 = Açık (ÖNERİLEN)
#
# $(cooldown) → COOLDOWN SİSTEMİ
#        0 = Kapalı
#        1 = Açık
#
# ÖRNEK:
# function global:init {...}
# ─────────────────────────────

$scoreboard players set #glc_menu_active global $(glc_menu)
$scoreboard players set #admin_loop global $(admin_loop)
$scoreboard players set #global_tick global $(tick)
$scoreboard players set #cooldown_active global $(cooldown)

# Yeni
$scoreboard players set #main global $(main)
