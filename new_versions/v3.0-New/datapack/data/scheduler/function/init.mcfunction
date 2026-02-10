# GULCE Scheduler System - İlk Yükleme
# Minecraft /schedule'dan bağımsız, oyuncu bazlı zamanlama sistemi

# Skorboard oluştur
scoreboard objectives add sch.time dummy "Zamanlayıcı Zamanı"
scoreboard objectives add sch.id dummy "Zamanlayıcı ID"
scoreboard objectives add sch.active dummy "Zamanlayıcı Aktif"
scoreboard objectives add sch.player dummy "Zamanlayıcı Oyuncu"

# Global sayaç
scoreboard players set $next_id sch.id 1

tellraw @a [{"text":"[SCHEDULER] ","color":"gold","bold":true},{"text":"Zamanlayıcı sistemi başlatıldı!","color":"green"}]
