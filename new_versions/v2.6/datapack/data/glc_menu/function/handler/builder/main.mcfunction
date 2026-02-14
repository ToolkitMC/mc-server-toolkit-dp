# ═══════════════════════════════════════════════════
# ⚡ GULCE CONTROL PANEL - CLEAN UI
# ═══════════════════════════════════════════════════

# Dialog Kontrolü
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 90

# Ana Panel - Sade ve Net Tasarım
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{"text":"⚡ GULCE PANEL","color":"gold","bold":true},body:{type:"minecraft:plain_message",contents:"\n§7Sistem ve izin yönetimi için bir kategori seçin:\n "},can_close_with_escape:true,pause:false,columns:2,actions:[]}

# --- [ SATIR 1 ] ---
data modify storage mc:dialog ui.actions append value {label:"§6📋 İzin Listesi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 2"}}

data modify storage mc:dialog ui.actions append value {label:"§b⚙ Ayarlar",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}}

# --- [ SATIR 2 ] ---
data modify storage mc:dialog ui.actions append value {label:"§a✚ Yeni Kayıt",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"➕ Yeni İzin Tanımla",inputs:[{type:"minecraft:text",key:"id",label:"Sistem ID"},{type:"minecraft:text",key:"player",label:"Oyuncu"},{type:"minecraft:text",key:"permission",label:"Yetki Düğümü"},{type:"minecraft:text",key:"level",label:"Seviye",initial:"1"}],actions:[{label:"✅ Kaydet",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:add/permission {id:\"$(id)\",player:\"$(player)\",permission:\"$(permission)\",level:$(level)}"}}]}}}

data modify storage mc:dialog ui.actions append value {label:"§e✎ Düzenle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"✍️ Veri Güncelleme",inputs:[{type:"minecraft:text",key:"id",label:"Düzenlenecek ID",label_visible:1b}],actions:[{label:"İlerle",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/builder/edit_single {id:\"$(id)\"}"}}]}}}

# --- [ SATIR 3 ] ---
data modify storage mc:dialog ui.actions append value {label:"§c⚠ Toplu Eylem",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}

data modify storage mc:dialog ui.actions append value {label:"§7◀ Geri Dön",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}