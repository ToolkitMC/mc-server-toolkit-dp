# Hızlı zamanlayıcı presetleri - Demo
# Kullanım: /function scheduler:demo_presets {player:"@s"}

tellraw @a [{"text":"[SCHEDULER] ","color":"gold","bold":true},{"text":"Demo preset'leri başlatılıyor...","color":"green"}]

# 5 saniye
$function scheduler:add {time:100,command:"say 5 saniye geçti!",player:"$(player)"}

# 10 saniye  
$function scheduler:add {time:200,command:"say 10 saniye geçti!",player:"$(player)"}

# 15 saniye
$function scheduler:add {time:300,command:"say 15 saniye geçti!",player:"$(player)"}

tellraw @a [{"text":"[SCHEDULER] ","color":"gold","bold":true},{"text":"3 demo zamanlayıcı başlatıldı!","color":"green"}]
