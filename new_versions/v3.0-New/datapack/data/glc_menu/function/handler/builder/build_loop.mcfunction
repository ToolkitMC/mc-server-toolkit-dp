# ═══════════════════════════════════════════════════
# İzin Buton Loop (Düzeltilmiş)
# ═══════════════════════════════════════════════════

# 1. Mevcut indeksi storage'a kaydet
execute store result storage mc:dialog temp.current_index int 1 run scoreboard players get #perm_index gulce_id

# 2. Veriyi çek (Bu fonksiyonun temp.current_perm'i doldurduğunu varsayıyoruz)
function glc_menu:handler/builder/get_permission with storage mc:dialog temp

# 3. Buton ekle
function glc_menu:handler/builder/add_button with storage mc:dialog temp.current_perm

# 4. İndeksi artır (İşlem bittikten sonra artırmak çakışmayı önler)
scoreboard players add #perm_index gulce_id 1

# 5. Temizlik: Bir sonraki döngü için geçici veriyi temizle
# (Eğer get_permission üstüne yazmıyorsa, eski veri kalıyor olabilir)
data remove storage mc:dialog temp.current_perm

# 6. Döngü kontrolü
execute if score #perm_index gulce_id < #perm_count gulce_id run function glc_menu:handler/builder/build_loop
