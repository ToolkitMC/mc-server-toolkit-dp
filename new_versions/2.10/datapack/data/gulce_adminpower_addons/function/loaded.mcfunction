# ==========================================
# SCOREBOARD SİSTEMİ
# ==========================================
scoreboard objectives add math dummy "Matematik"
scoreboard objectives add health health "Can"
scoreboard objectives add count dummy "Sayaç"
scoreboard objectives add temp dummy "Geçici"
scoreboard objectives add player_id dummy "Oyuncu ID"
scoreboard objectives add permission_level trigger

# ==========================================
# SABİT DEĞERLER (Fake Players)
# ==========================================
scoreboard players set #-1 math -1
scoreboard players set #0 math 0
scoreboard players set #1 math 1
scoreboard players set #2 math 2
scoreboard players set #3 math 3
scoreboard players set #4 math 4
scoreboard players set #5 math 5
scoreboard players set #10 math 10
scoreboard players set #20 math 20
scoreboard players set #50 math 50
scoreboard players set #100 math 100
scoreboard players set #1000 math 1000

# ==========================================
# STORAGE SİSTEMİ
# ==========================================
data merge storage custom:data {ayarlar:{debug:true,versiyon:"v2.9"},matematik:{sonuclar:[]}}

# ==========================================
# MATEMATİK ÖRNEKLERİ
# ==========================================

# Oyuncu sayısı hesaplama
execute store result score #oyuncu_sayisi count if entity @a
scoreboard players operation #oyuncu_x2 count = #oyuncu_sayisi count
scoreboard players operation #oyuncu_x2 count *= #2 math

# Bölme örneği
scoreboard players set #toplam count 100
scoreboard players set #bolen count 3
scoreboard players operation #bolum count = #toplam count
scoreboard players operation #bolum count /= #bolen count
scoreboard players operation #kalan count = #toplam count
scoreboard players operation #kalan count %= #bolen count

# Mod alma (kalan bulma)
scoreboard players set #test_mod count 17
scoreboard players operation #test_mod count %= #5 math

# Min/Max karşılaştırma
scoreboard players set #sayi1 count 42
scoreboard players set #sayi2 count 38
scoreboard players operation #max_sayi count = #sayi1 count
scoreboard players operation #max_sayi count > #sayi2 count
scoreboard players operation #min_sayi count = #sayi1 count
scoreboard players operation #min_sayi count < #sayi2 count

# Mutlak değer örneği
scoreboard players set #negatif count -15
scoreboard players operation #mutlak count = #negatif count
execute if score #mutlak count matches ..-1 run scoreboard players operation #mutlak count *= #-1 math

# Yüzde hesaplama (50'nin %30'u)
scoreboard players set #deger count 50
scoreboard players set #yuzde count 30
scoreboard players operation #sonuc_yuzde count = #deger count
scoreboard players operation #sonuc_yuzde count *= #yuzde count
scoreboard players operation #sonuc_yuzde count /= #100 math

# ==========================================
# SONUÇLARI GÖSTER
# ==========================================
tellraw @a {"text":"=====================================","color":"gold","bold":true}
tellraw @a {"text":"  📦 DATAPACK YÜKLEME RAPORU","color":"aqua","bold":true}
tellraw @a {"text":"=====================================","color":"gold","bold":true}
tellraw @a ""

# Versiyon bilgisi
tellraw @a [{"text":"🔷 Versiyon: ","color":"gray"},{"storage":"custom:data","nbt":"ayarlar.versiyon","color":"green"}]
tellraw @a ""

# Oyuncu bilgisi
tellraw @a [{"text":"👥 Aktif Oyuncu: ","color":"yellow"},{"score":{"name":"#oyuncu_sayisi","objective":"count"},"color":"white"}]
tellraw @a [{"text":"📊 Oyuncu x2: ","color":"aqua"},{"score":{"name":"#oyuncu_x2","objective":"count"},"color":"white"}]
tellraw @a ""

# Matematik sonuçları
tellraw @a {"text":"🧮 Matematik Testleri:","color":"light_purple","bold":true}
tellraw @a [{"text":"  • 100 ÷ 3 = ","color":"yellow"},{"score":{"name":"#bolum","objective":"count"},"color":"white"},{"text":" (Kalan: ","color":"gray"},{"score":{"name":"#kalan","objective":"count"},"color":"white"},{"text":")","color":"gray"}]
tellraw @a [{"text":"  • 17 mod 5 = ","color":"yellow"},{"score":{"name":"#test_mod","objective":"count"},"color":"white"}]
tellraw @a [{"text":"  • Max(42,38) = ","color":"yellow"},{"score":{"name":"#max_sayi","objective":"count"},"color":"white"}]
tellraw @a [{"text":"  • Min(42,38) = ","color":"yellow"},{"score":{"name":"#min_sayi","objective":"count"},"color":"white"}]
tellraw @a [{"text":"  • |-15| = ","color":"yellow"},{"score":{"name":"#mutlak","objective":"count"},"color":"white"}]
tellraw @a [{"text":"  • 50'nin %30'u = ","color":"yellow"},{"score":{"name":"#sonuc_yuzde","objective":"count"},"color":"white"}]
tellraw @a ""

# Durum mesajı
tellraw @a {"text":"=====================================","color":"gold","bold":true}
tellraw @a [{"text":"✅ ","color":"green","bold":true},{"text":"Tüm sistemler aktif!","color":"green"}]
tellraw @a {"text":"=====================================","color":"gold","bold":true}

# Ses efekti
execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.5

# ==========================================
# SCHEDULE İLE OTOMATİK GÜNCELLEME
# ==========================================
schedule function custom:auto_update 20t

