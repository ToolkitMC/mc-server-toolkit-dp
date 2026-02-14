# ═══════════════════════════════════════════════════
# Zamanlama Loop İşleyici
# ═══════════════════════════════════════════════════

# Mevcut zamanlamayı al
execute store result storage mc:_ temp.current_index int 1 run scoreboard players get #schedule_index gulce_id
function custom_admin:schedule/get_by_index with storage mc:_ temp

# Kalan süreyi azalt
execute store result score #remaining gulce_id run data get storage mc:_ temp.current_schedule.remaining
scoreboard players remove #remaining gulce_id 1

# Güncelle
execute store result storage mc:_ temp.current_schedule.remaining int 1 run scoreboard players get #remaining gulce_id
function custom_admin:schedule/update_remaining with storage mc:_ temp

# Süre doldu mu kontrol
execute if score #remaining gulce_id matches ..0 run function custom_admin:schedule/execute_scheduled

# Index artır
scoreboard players add #schedule_index gulce_id 1

# Devam et
execute if score #schedule_index gulce_id < #schedule_count gulce_id run function custom_admin:schedule/process_loop