# ═══════════════════════════════════════════════════
# Dialog Show - Gerçek Gösterici
# ═══════════════════════════════════════════════════

# Player head selector ile NAME'i al (@s context'ini kullanarak)
function glc_menu:handler/utils/player_name

# ui parametresini mc:dialog'dan glc_menu:names'e kopyala
data modify storage glc_menu:names temp.ui set from storage mc:dialog ui

# Yetki kontrol
execute unless entity @s[tag=gulce_admin] run function glc_menu:handler/dialog/not_permission with storage glc_menu:names temp
execute unless entity @s[tag=gulce_admin] run return 0

# Dialog göster (NAME ve ui storage'dan)
function glc_menu:handler/dialog/show_final with storage glc_menu:names temp

# Skor -1 yap (tekrar gösterilmesin)
scoreboard players set @s gulce_load.dialog -1

# Pending tag kaldır
tag @s remove glc.show_pending

# Tag temizle
tag @s remove closed.glc

# Log
execute if entity @s[tag=gulce_debug] run tellraw @s ["",{"text":"[GLC] ","color":"light_purple","bold":true},{"text":"Dialog gösterildi","color":"green"}]
