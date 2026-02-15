# Tek bir zamanlayıcının zamanını azalt
scoreboard players remove @s sch.time 1

# Zaman doldu mu kontrol et
execute if score @s sch.time matches ..0 run function scheduler:execute_task
