# ═══════════════════════════════════════════════════
# GLC Menu - Load Handler - DÜZELTİLDİ
# ═══════════════════════════════════════════════════

# Forceload (player head selector için)
forceload add 0 0

# Scoreboard
scoreboard objectives add gulce_menu trigger "GLC Menu"
scoreboard objectives add gulce_load.dialog dummy "Dialog Loading"

# Storage başlat
data modify storage mc:dialog ui set value {}
data modify storage mc:dialog temp set value {}
data modify storage glc_menu:names temp set value {}

# Ayar menüsü sistemi
scoreboard players add #opt_diamond_recipe gulce_id 0
scoreboard players add #opt_glc_menu gulce_id 0
scoreboard players add #opt_admin_loop gulce_id 0
scoreboard players add #opt_tick gulce_id 0
scoreboard players add #opt_cooldown gulce_id 0
scoreboard players add #opt_main_loop gulce_id 0
execute unless score #opt_glc_menu gulce_id matches 1.. run scoreboard players set #opt_glc_menu gulce_id 1
execute unless score #opt_admin_loop gulce_id matches 1.. run scoreboard players set #opt_admin_loop gulce_id 1
execute unless score #opt_tick gulce_id matches 1.. run scoreboard players set #opt_tick gulce_id 1
execute unless score #opt_cooldown gulce_id matches 1.. run scoreboard players set #opt_cooldown gulce_id 1
execute unless score #opt_main_loop gulce_id matches 1.. run scoreboard players set #opt_main_loop gulce_id 1

# Tüm tag'leri temizle
tag @a remove glc.show_pending
tag @a remove closed.glc
tag @a remove glc.close_dialog

# Tüm skorları sıfırla
scoreboard players set @a gulce_load.dialog -1

# Trigger aktifleştir
scoreboard players enable @a gulce_menu

# Başlangıç mesajı
tellraw @a[tag=gulce_admin] ["",{"text":"[GLC] ","color":"light_purple","bold":true},{"text":"Dinamik menü sistemi yüklendi","color":"gray"}]
