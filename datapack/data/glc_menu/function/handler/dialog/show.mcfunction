# ═══════════════════════════════════════════════════
# Dialog Show - Gerçek Gösterici - DÜZELTİLDİ
# ═══════════════════════════════════════════════════

# Dialog göster
execute as @p[tag=gulce_admin,tag=!closed.glc,limit=1,sort=arbitrary] at @s run function glc_menu:handler/dialog/show_final with storage mc:dialog

# Skor -1 yap (tekrar gösterilmesin)
scoreboard players set @s gulce_load.dialog -1

# Pending tag kaldır
tag @s remove glc.show_pending

# Tag temizle
tag @s remove closed.glc

# Log
tellraw @s[tag=gulce_debug] ["",{"text":"[GLC] ","color":"light_purple","bold":true},{"text":"Dialog gösterildi","color":"green"}]
