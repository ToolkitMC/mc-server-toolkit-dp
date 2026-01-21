# ═══════════════════════════════════════════════════
# Loading Dialog
# ═══════════════════════════════════════════════════

# Dialog Göster
dialog show @s {type:"minecraft:notice",title:"",body:{type:"minecraft:plain_message",contents:{"text":"\n\n\n\nHazırlanıyor...\n\n\n","extra":[{"text":"\n","extra":[{"score":{"objective":"gulce_load.dialog","name":"@s"},"type":"score","color":"light_purple","bold":true,"italic":false}]}],"bold":true,"italic":false}},can_close_with_escape:false,pause:false,after_action:"none"}
scoreboard players set @s gulce_load.dialog 5
scoreboard players set @s gulce_load.dialog 4
scoreboard players set @s gulce_load.dialog 3
scoreboard players set @s gulce_load.dialog 2
scoreboard players set @s gulce_load.dialog 1
scoreboard players set @s gulce_load.dialog 0

# Gösterim bekleyen tag
tag @s add glc.show_pending

# Tag ekle
tag @s add closed.glc
