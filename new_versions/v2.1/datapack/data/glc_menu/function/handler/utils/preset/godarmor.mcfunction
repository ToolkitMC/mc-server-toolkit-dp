# İzin Ekle:
function custom_admin:add/permission {id:1,player:"@s",permission:"Godarmor",level:3}

# Eylem Ekle:
function glc_menu:handler/utils/edit_form/set_action {id:1,type:"command",args:"{\"command\":\"function custom:tools/godarmor {\\\"target\\\":\\\"@s\\\",\\\"player\\\":\\\"@s\\\"}\"}",name:"@s"}