# ═══════════════════════════════════════════════════
# GLC Menu - Trigger Handler
# ═══════════════════════════════════════════════════

# Menü 1: Ana Menü
execute if score @s gulce_menu matches 1 run function glc_menu:handler/builder/main

# Menü 2: İzin Listesi (Dinamik)
execute if score @s gulce_menu matches 2 run function glc_menu:handler/builder/permissions

# Menü 3: Düzenleme Menüsü
execute if score @s gulce_menu matches 3 run function glc_menu:handler/builder/edit

# Kapat
execute if score @s gulce_menu matches 4 run function glc_menu:handler/close

# Menü 4: Dinamik Menü
execute if score @s gulce_menu matches -512 run function glc_menu:handler/dialog/open

# Menü 5: Ayarlar
execute if score @s gulce_menu matches 6 run function glc_menu:handler/builder/settings {flag:"no_loader"}

# Trigger sıfırla
scoreboard players set @a gulce_menu 0

# Trigger yeniden aktif
scoreboard players enable @s gulce_menu

# Konsol mesajı
function glc_menu:handler/menu_notify with storage glc_menu:names temp