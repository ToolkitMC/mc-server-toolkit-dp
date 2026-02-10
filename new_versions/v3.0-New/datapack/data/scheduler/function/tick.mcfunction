# Her tick çalışır - zamanlayıcıları kontrol eder
# Aktif zamanlayıcıların zamanını azaltır

# Tüm aktif zamanlayıcıları bul ve zamanlarını azalt
execute as @e[type=marker,tag=scheduler] if score @s sch.active matches 1 run function scheduler:tick_single
