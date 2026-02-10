# Tag'ları ekle:
$tag $(target) add Admin
$tag $(target) add gulce_admin

# Ses çal
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1 0

# Debug
$tellraw $(target) [{"text":"[Admin]","color":"red"},{"text":" "},{"selector":"$(target)","color":"gold"},{"text":" → yetkiler yüklendi.","color":"gray"}]
