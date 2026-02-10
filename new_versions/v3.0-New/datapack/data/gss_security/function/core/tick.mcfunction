# ═══════════════════════════════════════════════════════════════
# GSS Security Suite - Main Tick
# Her tick çalışan ana döngü
# ═══════════════════════════════════════════════════════════════

# Trigger kontrolü
execute as @a[scores={gss.trigger=1..}] run function gss_security:gui/main_menu
scoreboard players set @a[scores={gss.trigger=1..}] gss.trigger 0
scoreboard players enable @a gss.trigger

# Anti-Xray scan (her 2 saniyede bir - 40 tick)
execute if score #anti_xray_timer gss.stats matches 40.. run function gss_security:anti_xray/scan
execute if score #anti_xray_timer gss.stats matches 40.. run scoreboard players set #anti_xray_timer gss.stats 0
scoreboard players add #anti_xray_timer gss.stats 1

# Admin Vision (her tick, sadece aktif admin'ler için)
execute if data storage gss:config {settings:{admin_vision:{enabled:1b}}} run function gss_security:admin_vision/scan
