# ═══════════════════════════════════════════════════
# Zamanlanmış Eylemi Çalıştır
# ═══════════════════════════════════════════════════

# Action ID ve player al
data modify storage mc:_ temp.exec_id set from storage mc:_ temp.current_schedule.action_id
data modify storage mc:_ temp.exec_player set from storage mc:_ temp.current_schedule.player

# Eylemi çalıştır
function custom_admin:schedule/run_action with storage mc:_ temp

# Tekrar kontrolü
execute if data storage mc:_ temp.current_schedule{repeat:1b} run function custom_admin:schedule/reset_delay with storage mc:_ temp

# Tekrar değilse sil
execute unless data storage mc:_ temp.current_schedule{repeat:1b} run function custom_admin:schedule/remove_current with storage mc:_ temp

# Log
tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"⏰ Zamanlanmış eylem çalıştırıldı","color":"green"}]