# ═══════════════════════════════════════════════════
# Ana Menü Builder
# ═══════════════════════════════════════════════════

# Loading göster
tag @s add glc.show_pending
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 30

# Ana menü JSON'ı hazırla
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{"text":"🎮 GULCE İzin Yönetimi","color":"gold","bold":true},body:{type:"minecraft:plain_message",contents:"§l§a✨ İzinleri buradan yönetebilirsiniz\n\n§7• İzin Listesi (Yürüt/Düzenle/Sil)\n§7• Yeni İzin Ekle"},can_close_with_escape:true,pause:false,actions:[]}

# Butonları ekle
data modify storage mc:dialog ui.actions append value {label:"📋 İzin Listesi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 2"}}

data modify storage mc:dialog ui.actions append value {label:"➕ Yeni İzin Ekle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"➕ Yeni İzin Ekle",inputs:[{type:"minecraft:text",key:"id",label:"ID",max_length:100},{type:"minecraft:text",key:"player",label:"Oyuncu",max_length:100},{type:"minecraft:text",key:"permission",label:"İzin Adı",max_length:100},{type:"minecraft:text",key:"level",label:"Seviye",initial:"1",max_length:10}],actions:[{label:"✅ Ekle",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:add/permission {id:\"$(id)\",player:\"$(player)\",permission:\"$(permission)\",level:$(level)}"}}]}}}

data modify storage mc:dialog ui.actions append value {label:"◀️ Ana Panel",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}

data modify storage mc:dialog ui.actions append value {label:"⚠ Toplu Eylemler",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}

data modify storage mc:dialog ui.actions append value {label:"⏺ Düzenle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"",inputs:[{type:"minecraft:text",key:"id",label:"ID",label_visible:1b,max_length:2000000000}],can_close_with_escape:1b,pause:0b,after_action:"close",columns:1,actions:[{label:"İleri",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/builder/edit_single {id:\"$(id)\"}"}}]}}}

