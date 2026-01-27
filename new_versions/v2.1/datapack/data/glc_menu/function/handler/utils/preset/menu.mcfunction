# İzin Ekle:
function custom_admin:add/permission {id:3,player:"@s",permission:"Menü",level:3}

# Eylem Ekle:
function glc_menu:handler/utils/edit_form/set_action {id:3,type:"command",args:"{\"command\":\"trigger gulce_menu set 1\"}",name:"@s"}