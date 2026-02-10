# ═══════════════════════════════════════════════════════════════
# GSS Security Suite - Main Menu
# Interactive GUI with clickable text components
# ═══════════════════════════════════════════════════════════════

tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 20

# Ana Veri Bloğu (Boşluksuz ve Tam Liste)
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{text:"🛡 GSS Security Suite",color:"gold",bold:true},body:{type:"minecraft:plain_message",contents:"§8Powered by Bookshelf v3.2+\n\n§e§l📊 İSTATİSTİKLER\n§7Sistem durumunu kontrol edin."},can_close_with_escape:true,pause:false,columns:1,actions:[]}

# Butonlar - Eksiksiz Aktarım
data modify storage mc:dialog ui.actions append value {label:"🛡 Anti-Xray",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:gui/stats"}}
data modify storage mc:dialog ui.actions append value {label:"👁 Admin Vision",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:admin_vision/toggle"}}
data modify storage mc:dialog ui.actions append value {label:"🏗 Zones",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:gui/zones"}}
data modify storage mc:dialog ui.actions append value {label:"⚙️ Ayarlar",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:gui/settings"}}
data modify storage mc:dialog ui.actions append value {label:"📜 Loglar",width:140,action:{type:"minecraft:run_command",command:"/function #bs.log:history {with:{}}"}}
data modify storage mc:dialog ui.actions append value {label:"🔍 Debug",width:140,action:{type:"minecraft:run_command",command:"/tag @s add gss_security.log._.debug"}}

# Komut Kısayolları (Suggest Command Destekli)
data modify storage mc:dialog ui.actions append value {label:"⌨️ /trigger gss",width:290,action:{type:"minecraft:run_command",command:"/trigger gss.trigger"}}
data modify storage mc:dialog ui.actions append value {label:"📂 Config Dump",width:290,action:{type:"minecraft:run_command",command:"execute as @s run function #bs.dump:var {var: [\"storage gss:config settings\"]}"}}

# Navigasyon
data modify storage mc:dialog ui.actions append value {label:"◀️ Geri Dön",width:290,action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}

# Debug Bildirimi
execute if entity @s[tag=gulce_debug] run tellraw @s {"text":"[GSS] UI Verisi Storage'a işlendi.","color":"green"}

playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1.5
