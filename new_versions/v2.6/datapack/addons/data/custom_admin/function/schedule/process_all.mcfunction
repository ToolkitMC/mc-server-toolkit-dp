# ═══════════════════════════════════════════════════
# Tüm Zamanlamaları İşle
# ═══════════════════════════════════════════════════

# Sayaç sıfırla
scoreboard players set #schedule_index gulce_id 0

# Toplam sayıyı al
execute store result score #schedule_count gulce_id run data get storage mc:handler data.scheduled

# İşleme başla
execute if score #schedule_count gulce_id matches 1.. run function custom_admin:schedule/process_loop