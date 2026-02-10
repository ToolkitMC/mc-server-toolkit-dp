# ═══════════════════════════════════════════════════════════════
# GSS Admin Vision - Show Entity
# Tespit edilen entity'leri göster
# ═══════════════════════════════════════════════════════════════

# Entity'nin etrafında particle ring
particle minecraft:glow ~ ~1 ~ 0.5 0.5 0.5 0 20 force @a[tag=gulceos_permissions_admin,scores={gss.vision=1..}]

# Entity bilgisini admin'e göster
execute as @a[tag=gulceos_permissions_admin,scores={gss.vision=1..}] run title @s actionbar [{"text":"👁️ Hedef: ","color":"aqua"},{"selector":"@s","color":"yellow"}]

# Distance bilgisi (lambda'dan)
execute store result score #vision_distance gss.stats run scoreboard players get $raycast.distance bs.lambda
execute as @a[tag=gulceos_permissions_admin,scores={gss.vision=1..}] run tellraw @s [{"text":"📏 Mesafe: ","color":"gray"},{"score":{"name":"#vision_distance","objective":"gss.stats"},"color":"yellow"},{"text":" blok","color":"gray"}]
