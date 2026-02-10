# ═══════════════════════════════════════════════════
# Player Head Selector - Oyuncu Adını Al
# ═══════════════════════════════════════════════════
# NOT: forceload load.mcfunction'da bir kere yapılıyor

# Shulker box yerleştir
setblock 0 300 0 black_shulker_box replace

# Player head oluştur (context'teki player için)
loot insert 0 300 0 loot glc_menu:fph

# Storage'ı temizle ve NAME'i al
data remove storage glc_menu:names temp
data modify storage glc_menu:names temp.NAME set from block 0 300 0 Items[0].components."minecraft:profile".name

# UUID'yi de kaydet
data modify storage glc_menu:names temp.UUID set from entity @s UUID

# Temizlik
setblock 0 300 0 air
