# Mesaj At
tellraw @a [{"text":"[ServerToolkit]: "},{"text":"Yeniden yükleniyor!","color":"gold"}]

# Yeniden Yükle
$datapack disable "file/$(pack)"
$datapack enable "file/$(pack)"

# Başarı Mesajı At
schedule function gulce_adminpower_addons:reload/3 20t