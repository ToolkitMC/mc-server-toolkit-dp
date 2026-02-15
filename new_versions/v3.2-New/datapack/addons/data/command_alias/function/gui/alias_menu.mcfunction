# ═══════════════════════════════════════════════════
# ⚡ COMMAND ALIAS MENÜSÜ
# ═══════════════════════════════════════════════════

# Dialog tetikleme
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
scoreboard players set @s gulce_load.dialog 2

# Command Alias UI
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{"text":"⚡ Command Aliases","color":"yellow","bold":true},body:{type:"minecraft:plain_message",contents:"Hazır komut paketleri. Cooldown kontrollü."},can_close_with_escape:1b,pause:0b,inputs:[{type:"minecraft:single_option",key:"alias",label:"Bir alias seç:",options:[{id:"1",display:"❤ Heal & Feed"},{id:"2",display:"🗑 Clear & Announce"},{id:"3",display:"✈ TP with Notify"},{id:"4",display:"⚡ Creative + Effects"},{id:"5",display:"🎉 Event Preparation"},{id:"6",display:"❄ Quick Freeze"},{id:"7",display:"🛡 Moderator Toolkit"}]}],actions:[]}

# Uygula butonu
data modify storage mc:dialog ui.actions append value {label:"✅ Uygula",action:{type:"minecraft:dynamic/run_command",template:"/trigger ca.trigger set $(alias)"}}

# Ana menüye dön
data modify storage mc:dialog ui.actions append value {label:"◀ Geri",action:{type:"minecraft:run_command",command:"/function command_alias:gui/main_menu"}}

# Kapat
data modify storage mc:dialog ui.actions append value {label:"❌ Kapat",action:{type:"minecraft:suggest_command",command:" "}}