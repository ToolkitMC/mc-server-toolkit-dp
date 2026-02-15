# ═══════════════════════════════════════════════════
# 🎛 ANA MENÜ - CLICKABLE ITEM & ALIAS PANEL
# ═══════════════════════════════════════════════════

# Güvenli temizlik
tag @s remove glc.show_pending
scoreboard players reset @s glc_load_type
scoreboard players reset @s gulce_load.dialog

# Dialog tetikleme tag'i
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
scoreboard players set @s gulce_load.dialog 2

# Ana menü oluştur
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{"text":"🎛 Ana Panel","color":"gold","bold":true},body:{type:"minecraft:plain_message",contents:"Hangi işlemi yapmak istiyorsun?"},can_close_with_escape:1b,pause:0b,after_action:"close",columns:2,actions:[]}

# Clickable Item menüsüne git
data modify storage mc:dialog ui.actions append value {label:"🎁 Clickable Item Oluştur",action:{type:"minecraft:run_command",command:"/function command_alias:gui/clickable_menu"}}

# Command Alias menüsüne git
data modify storage mc:dialog ui.actions append value {label:"⚡ Command Alias Çalıştır",action:{type:"minecraft:run_command",command:"/function command_alias:gui/alias_menu"}}

# Kapat butonu
data modify storage mc:dialog ui.actions append value {label:"❌ Kapat",action:{type:"minecraft:suggest_command",command:" ",tooltip:"Kapat"}}