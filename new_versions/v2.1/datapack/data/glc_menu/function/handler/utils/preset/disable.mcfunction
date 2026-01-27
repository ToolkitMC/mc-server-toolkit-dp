# İzin Ekle:
function custom_admin:add/permission {id:4,player:"@s",permission:"Devre dışı bırak",level:3}

# Eylem Ekle:
function glc_menu:handler/utils/edit_form/set_action {id:4,type:"command",args:"{\"command\":\"function vc_experimental:disable_all\"}",name:"@s"}