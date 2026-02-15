# GULCE Player Tracker System
# Her oyuncuyu takip eder ve bilgilerini saklar

scoreboard objectives add ply.joined minecraft.custom:minecraft.leave_game "Ayrılma Sayısı"
scoreboard objectives add ply.online dummy "Online Durumu"
scoreboard objectives add ply.uuid dummy "Oyuncu UUID Hash"
scoreboard objectives add ply.id dummy "Oyuncu ID"

# Global sayaç
scoreboard players set $next_player_id ply.id 1

tellraw @a [{"text":"[TRACKER] ","color":"aqua","bold":true},{"text":"Oyuncu takip sistemi aktif!","color":"green"}]
