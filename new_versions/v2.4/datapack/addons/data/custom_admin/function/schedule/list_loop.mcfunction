# ═══════════════════════════════════════════════════
# Liste Gösterme Döngüsü
# ═══════════════════════════════════════════════════

# İlk elemanı al
data modify storage mc:_ temp.list_item set from storage mc:_ temp.list_scheduled[0]

# Göster
function custom_admin:schedule/display_item with storage mc:_ temp.list_item

# Listeden çıkar
data remove storage mc:_ temp.list_scheduled[0]

# Devam et
execute if data storage mc:_ temp.list_scheduled[0] run function custom_admin:schedule/list_loop