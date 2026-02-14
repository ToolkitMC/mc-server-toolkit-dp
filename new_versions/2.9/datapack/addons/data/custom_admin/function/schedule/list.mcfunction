# ═══════════════════════════════════════════════════
# Aktif Zamanlamaları Listele (Chat)
# ═══════════════════════════════════════════════════

# Başlık
tellraw @s ["",{"text":"═══════════════════════════════════","color":"aqua","bold":true}]
tellraw @s ["",{"text":"⏰ Aktif Zamanlamalar","color":"gold","bold":true}]
tellraw @s ["",{"text":"═══════════════════════════════════","color":"aqua","bold":true}]

# Sayı kontrolü
execute store result score #scheduled_count gulce_id run data get storage mc:handler data.scheduled

# Boş kontrol
execute if score #scheduled_count gulce_id matches 0 run tellraw @s ["",{"text":"  ❌ Aktif zamanlama yok","color":"red"}]
execute if score #scheduled_count gulce_id matches 0 run tellraw @s ["",{"text":"═══════════════════════════════════","color":"aqua","bold":true}]
execute if score #scheduled_count gulce_id matches 0 run return 0

# Liste hazırla
data modify storage mc:_ temp.list_scheduled set from storage mc:handler data.scheduled
function custom_admin:schedule/list_loop

# Toplam
tellraw @s ["",{"text":"  📊 Toplam: ","color":"gray"},{"score":{"name":"#scheduled_count","objective":"gulce_id"},"color":"yellow"},{"text":" zamanlama","color":"gray"}]

# Alt çizgi
tellraw @s ["",{"text":"═══════════════════════════════════","color":"aqua","bold":true}]