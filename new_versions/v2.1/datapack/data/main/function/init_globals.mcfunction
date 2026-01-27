# ─────────────────────────────
# GLOBAL STATE (INIT / DEFAULT)
# SADECE LOAD'TA ÇALIŞIR
# ─────────────────────────────

# Sistemler varsayılan olarak KAPALI
# Manuel açılacaklar
scoreboard players set #glc_menu_active global 0
scoreboard players set #admin_loop global 1
scoreboard players set #global_tick global 1
scoreboard players set #cooldown_active global 0
scoreboard players set #main global 1

# ═══════════════════════════════════════════════════
# SCHEDULE SİSTEMİ İÇİN NOTLAR
# ═══════════════════════════════════════════════════
# Bir sistemi aktif etmek için flag'i 1 yapın:
# 
# /scoreboard players set #global_tick global 1
# /schedule function global:tick 3t replace
#
# /scoreboard players set #admin_loop global 1
# /schedule function custom_admin:handler/loop/all/1 2t replace
#
# /scoreboard players set #main global 1
# /schedule function gulce_adminpower_addons:loop 5t replace
# ═══════════════════════════════════════════════════
