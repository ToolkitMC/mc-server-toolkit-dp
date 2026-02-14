# ═══════════════════════════════════════════════════
# Tüm Zamanlamaları Temizle
# ═══════════════════════════════════════════════════

# Sayı al
execute store result score #cleared gulce_id run data get storage mc:handler data.scheduled

# Temizle
data remove storage mc:handler data.scheduled
data modify storage mc:handler data.scheduled set value []

# Feedback
tellraw @s ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"🗑️ Tüm zamanlamalar temizlendi: ","color":"green"},{"score":{"name":"#cleared","objective":"gulce_id"},"color":"yellow"}]

# Log
tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"Zamanlamalar temizlendi: ","color":"gray"},{"selector":"@s","color":"yellow"}]