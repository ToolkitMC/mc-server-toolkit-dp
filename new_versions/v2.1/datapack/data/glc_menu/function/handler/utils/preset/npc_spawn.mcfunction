# İzin Ekle:
function custom_admin:add/permission {id:5,player:"@s",permission:"Spawn NPC",level:3}

# Eylem Ekle:
function glc_menu:handler/utils/edit_form/set_action {id:5,type:"command",args:"{\"command\":\"function glc_menu:npc\"}",name:"@s"}