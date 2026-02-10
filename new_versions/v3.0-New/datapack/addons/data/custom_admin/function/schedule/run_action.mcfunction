# ═══════════════════════════════════════════════════
# Zamanlanmış Eylem Çalıştırıcı (MACRO)
# ═══════════════════════════════════════════════════

# Hedef oyuncuyu bul ve eylemi çalıştır
$execute as $(exec_player) run function custom_admin:execute/action {id:"$(exec_id)"}

# Feedback
$tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"⏰ Çalıştırıldı: ","color":"gray"},{"text":"$(exec_id)","color":"yellow"},{"text":" → ","color":"gray"},{"text":"$(exec_player)","color":"aqua"}]