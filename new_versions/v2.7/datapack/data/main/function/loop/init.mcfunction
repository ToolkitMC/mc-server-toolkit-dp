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

# ARTIK BURADAN ÇAĞRILMIYOR!
# Schedule ile kendi kendini çağırıyor
# Başlatma: main:load içinden


# ─────────────────────────────
# GLOBAL İŞLER (Schedule - 3 tick)
# ─────────────────────────────

# ARTIK BURADAN ÇAĞRILMIYOR!
# Schedule ile kendi kendini çağırıyor
# Başlatma: main:load içinden


# ─────────────────────────────
# COOLDOWN (Her Tick - Kritik)
# ─────────────────────────────

execute if score #cooldown_active global matches 1 run function cooldown:loop


# ─────────────────────────────
# ANA İŞLER / ADDONS (Schedule - 5 tick)
# ─────────────────────────────

# ARTIK BURADAN ÇAĞRILMIYOR!
# Schedule ile kendi kendini çağırıyor
# Başlatma: main:load içinden
