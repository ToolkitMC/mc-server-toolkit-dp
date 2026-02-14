# ═══════════════════════════════════════════════════
# Tekrarlayan Eylemin Delay'ini Sıfırla
# ═══════════════════════════════════════════════════

# Delay'i remaining'e kopyala
data modify storage mc:_ temp.current_schedule.remaining set from storage mc:_ temp.current_schedule.delay

# Güncelle
function custom_admin:schedule/update_remaining with storage mc:_ temp

# Log
tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"🔄 Eylem tekrar zamanlandı","color":"yellow"}]