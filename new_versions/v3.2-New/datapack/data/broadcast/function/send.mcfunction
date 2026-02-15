# Tüm oyunculara gelişmiş mesaj gönder
# Kullanım: /function broadcast:send {title:"Başlık",message:"Mesaj",color:"gold"}

$tellraw @a [{"text":"[DUYURU] ","color":"red","bold":true},{"text":"$(title)","color":"$(color)","bold":true}]
$tellraw @a [{"text":"$(message)","color":"white"}]
playsound minecraft:block.note_block.bell master @a ~ ~ ~ 1 1
