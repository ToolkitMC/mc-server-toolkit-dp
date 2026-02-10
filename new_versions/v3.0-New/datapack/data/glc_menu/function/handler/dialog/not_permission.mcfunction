# Pending tag kaldır
tag @s remove glc.show_pending

# Tag temizle
tag @s remove closed.glc

# Dialog Aç
$execute as $(NAME) run return run dialog show @s {type:"minecraft:notice",title:"",body:{type:"minecraft:plain_message",contents:{text:"Yetkiniz Yok!",bold:1b,italic:0b,color:"red"}},can_close_with_escape:0b,pause:0b,after_action:"none",action:{label:"Kapat",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/close"}}}