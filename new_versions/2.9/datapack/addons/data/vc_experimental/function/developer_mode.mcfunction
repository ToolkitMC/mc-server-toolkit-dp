# Tag'ları ekle
$tag $(target) add Admin
$tag $(target) add gulce_admin
$tag $(target) add gulce_debug
$tag $(target) add Owner
$tag $(target) add gss_security.log._.debug

# Ses çal
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1 0

# Debug
$tellraw $(target) [{"text":"[DEV]","color":"dark_gray"},{"text":" "},{"selector":"$(target)","color":"gold"},{"text":" → yetkiler yüklendi.","color":"gray"}]
