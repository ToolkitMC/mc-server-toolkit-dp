# ═══════════════════════════════════════════════════
# GLC Menu - Load Handler - DÜZELTİLDİ
# ═══════════════════════════════════════════════════

# Scoreboard
scoreboard objectives add gulce_menu trigger "GLC Menu"
scoreboard objectives add gulce_load.dialog dummy "Dialog Loading"

# Storage başlat
data modify storage mc:dialog ui set value {}
data modify storage mc:dialog temp set value {}

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