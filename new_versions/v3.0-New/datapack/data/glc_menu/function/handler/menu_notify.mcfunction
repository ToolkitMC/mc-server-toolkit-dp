# Konsol mesajı
$tellraw $(NAME) ["",{"text":"[GULCE-MENU] ","color":"gold","bold":true},{"text":"Menü açıldı!","color":"green"}]
$tellraw $(NAME) ["",{"text":"Tekrar açmak için: ","color":"yellow"},{"text":"/trigger gulce_menu","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/trigger gulce_menu"}}]