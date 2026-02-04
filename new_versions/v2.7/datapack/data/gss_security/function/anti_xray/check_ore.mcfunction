# ═══════════════════════════════════════════════════════════════
# GSS Anti-Xray - Ore Check
# Raycast'in hedef aldığı bloğu kontrol et
# ═══════════════════════════════════════════════════════════════

# Değerli cevher mi kontrol et
execute if block ~ ~ ~ #minecraft:diamond_ores run scoreboard players add @s gss.xray 3
execute if block ~ ~ ~ #minecraft:coal_ores run scoreboard players add @s gss.xray 1
execute if block ~ ~ ~ #minecraft:iron_ores run scoreboard players add @s gss.xray 1
execute if block ~ ~ ~ #minecraft:gold_ores run scoreboard players add @s gss.xray 2
execute if block ~ ~ ~ #minecraft:emerald_ores run scoreboard players add @s gss.xray 4
execute if block ~ ~ ~ minecraft:ancient_debris run scoreboard players add @s gss.xray 5

# Threshold kontrolü (config'den al)
execute store result score #threshold gss.stats run data get storage gss:config settings.anti_xray.suspicious_threshold

# Şüpheli skor aşıldıysa uyar
execute if score @s gss.xray >= #threshold gss.stats run function gss_security:anti_xray/suspicious_detected

# Lambda datayı debug için kaydet
execute store result storage gss:temp raycast.distance int 1 run scoreboard players get $raycast.distance bs.lambda
