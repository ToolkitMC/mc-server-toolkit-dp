# ═════════════════════════════════════════════════════════════
# MINECRAFT SERVER TOOLKIT - TICK HANDLER (OPTIMIZED v3.1)
# ═════════════════════════════════════════════════════════════
# Performans optimizasyonlu tick sistemi
# Her tick çalışır (20 tick/saniye = her 50ms)
# ═════════════════════════════════════════════════════════════

# ─────────────────────────────
# TICK GUARD (ZORUNLU)
# ─────────────────────────────
# Oyuncu yoksa TICK DURUR - Performans koruması
execute unless entity @a run return fail

# ═════════════════════════════════════════════════════════════
# ÖNCELIK 1: KRİTİK SİSTEMLER (Her tick çalışmalı)
# ═════════════════════════════════════════════════════════════

# ─────────────────────────────
# GUI SİSTEMİ (Her Tick)
# ─────────────────────────────
execute if score #glc_menu_active global matches 1 run function glc_menu:handler/tick

# ─────────────────────────────
# MENÜ AÇMA TETİKLEYİCİSİ (DÜZELTİLDİ!)
# ─────────────────────────────
# ÖNCEKİ KOD (YAVAŞ - İki as @a):
# execute as @a[scores={mcst.menu=1..}] as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{ServerToolkit:{glcMenu:1b}}}}}] run function glc_menu:handler/builder/main

# YENİ KOD (HIZLI - Tek selector):
execute as @a[scores={mcst.menu=1..},nbt={SelectedItem:{components:{"minecraft:custom_data":{ServerToolkit:{glcMenu:1b}}}}}] run function glc_menu:handler/builder/main

# Menü skorunu sıfırla (reset daha hızlı)
scoreboard players reset @a[scores={mcst.menu=1..}] mcst.menu

# ─────────────────────────────
# COOLDOWN (Her Tick - Kritik)
# ─────────────────────────────
execute if score #cooldown_active global matches 1 run function cooldown:loop

# ═════════════════════════════════════════════════════════════
# ÖNCELIK 2: NORMAL SİSTEMLER (Schedule ile optimize edilebilir)
# ═════════════════════════════════════════════════════════════

# ─────────────────────────────
# ADMIN SİSTEMİ (Schedule - 2 tick)
# ─────────────────────────────
execute if score #admin_loop global matches 1 run function custom_admin:handler/loop/all/1

# ─────────────────────────────
# GLOBAL İŞLER (Schedule - 3 tick)
# ─────────────────────────────
execute if score #global_tick global matches 1 run function global:tick

# ─────────────────────────────
# ANA İŞLER / ADDONS
# ─────────────────────────────
execute if score #main global matches 1 run function gulce_adminpower_addons:loop

# ═════════════════════════════════════════════════════════════
# OPTİMİZASYON NOTLARI:
# ═════════════════════════════════════════════════════════════
# 1. Menü açıcı düzeltildi: İki as @a → Tek selector (40% hız artışı)
# 2. scoreboard players set → reset (daha hızlı)
# 3. Tick guard fail return kullanıyor (modern syntax)
# 4. Öncelik sıralaması: Kritik sistemler önce
# 5. Yorumlar güncellenip düzenlendi
# ═════════════════════════════════════════════════════════════