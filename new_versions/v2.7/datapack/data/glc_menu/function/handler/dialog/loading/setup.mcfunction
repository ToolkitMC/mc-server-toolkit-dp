scoreboard objectives add glc_load_type dummy

# --- [ 4 EKRAN TÜRÜ ] ---
# Mod 1: Yükleme
execute if score @s glc_load_type matches 1 run data modify storage glc:system loading set value {title:"⌛",body:"\n§fİçerik Yükleniyor...\n§7Lütfen bekleyiniz.\n ",cancel:"✖ İptal",value:"/function glc_menu:handler/close"}

# Mod 2: Kaydetme
execute if score @s glc_load_type matches 2 run data modify storage glc:system loading set value {title:"💾",body:"\n§eDeğişiklikler İşleniyor...\n§7Veritabanı güncelleniyor.\n ",cancel:"✖ Durdur",value:"/function glc_menu:handler/close"}

# Mod 3: Kritik
execute if score @s glc_load_type matches 3 run data modify storage glc:system loading set value {title:"⚠️",body:"\n§cKritik İşlem Yürütülüyor!\n§4Lütfen pencereyi kapatmayın.\n ",cancel:"🔒 Bekle",value:""}

# Mod 4: Başarılı
execute if score @s glc_load_type matches 4 run data modify storage glc:system loading set value {title:"✅",body:"\n§aİşlem Tamamlandı!\n§7Tüm veriler senkronize edildi.\n ",cancel:"Anladım",value:"/function glc_menu:handler/close"}


function glc_menu:handler/dialog/loading/render with storage glc:system loading