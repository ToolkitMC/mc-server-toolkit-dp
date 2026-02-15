# ═══════════════════════════════════════════════════
# 🎁 CLICKABLE ITEM MENÜSÜ
# ═══════════════════════════════════════════════════

# Dialog tetikleme
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
scoreboard players set @s gulce_load.dialog 2

# Clickable Item UI
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{"text":"🎁 Clickable Item Oluştur","color":"aqua","bold":true},body:{type:"minecraft:plain_message",contents:"Carrot on a Stick tabanlı tıklanabilir item oluştur."},can_close_with_escape:1b,pause:0b,inputs:[{type:"minecraft:text",key:"name",label:"🏷 Item Adı",initial:"Buton",max_length:1000},{type:"minecraft:text",key:"exec",label:"⚡ Çalıştırılacak Komut",initial:"say Merhaba",max_length:100000},{type:"minecraft:text",key:"model",label:"🎨 Item Model (namespace:model)",initial:"minecraft:stick",max_length:1000}],actions:[]}

# Ver butonu
data modify storage mc:dialog ui.actions append value {label:"✅ Ver",action:{type:"minecraft:dynamic/run_command",template:"/give @s minecraft:carrot_on_a_stick[custom_name='{\"text\":\"$(name)\"}',custom_data={CA:{Clickable:1b,command:\"$(exec)\"}},minecraft:item_model=\"$(model)\"]"}}

# Ana menüye dön
data modify storage mc:dialog ui.actions append value {label:"◀ Geri",action:{type:"minecraft:run_command",command:"/function command_alias:gui/main_menu"}}

# Kapat
data modify storage mc:dialog ui.actions append value {label:"❌ Kapat",action:{type:"minecraft:suggest_command",command:" "}}