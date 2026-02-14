# ═══════════════════════════════════════════════════
# Mevcut Zamanlamayı Sil (MACRO)
# ═══════════════════════════════════════════════════

$data remove storage mc:handler data.scheduled[$(current_index)]

# Index'i azalt (çünkü bir eleman silindi)
scoreboard players remove #schedule_index gulce_id 1
scoreboard players remove #schedule_count gulce_id 1

# Log
tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"🗑️ Zamanlama tamamlandı ve silindi","color":"gray"}]