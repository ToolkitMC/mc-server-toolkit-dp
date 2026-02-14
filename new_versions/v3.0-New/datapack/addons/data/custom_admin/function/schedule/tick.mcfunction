# ═══════════════════════════════════════════════════
# Zamanlayıcı Tick - Her tick çalışır
# ═══════════════════════════════════════════════════

# Zamanlanmış eylemler var mı kontrol
execute if data storage mc:handler data.scheduled[0] run function custom_admin:schedule/process_all

# Temizlik
data remove storage mc:_ temp.scheduled_processed