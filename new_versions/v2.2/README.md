# Player Head Selector Entegrasyonu

## Yapılan Değişiklikler

### show.mcfunction
`/datapack/data/glc_menu/function/handler/dialog/show.mcfunction`

**ÖNCESİ:**
```mcfunction
execute as @p[tag=gulce_admin,tag=!closed.glc,limit=1,sort=arbitrary] at @s positioned ~ ~ ~ rotated as @s run function glc_menu:handler/dialog/show_final with storage mc:dialog
```

**SONRASI:**
```mcfunction
# Player head tabanlı isim seçici çalıştır
execute as @p[tag=gulce_admin,tag=!closed.glc,limit=1,sort=arbitrary] at @s positioned ~ ~ ~ rotated as @s run function glc_menu:handler/utils/player_name

# Dialog göster (NAME storage'dan alınarak)
execute as @p[tag=gulce_admin,tag=!closed.glc,limit=1,sort=arbitrary] at @s positioned ~ ~ ~ rotated as @s run function glc_menu:handler/dialog/show_final with storage glc_menu:names temp
```

## Nasıl Çalışıyor?

1. **player_name.mcfunction** çağrılır
   - Bu fonksiyon `glc_menu:fph` loot table'ı kullanarak player head oluşturur
   - Player'ın ismini `glc_menu:names temp.NAME` storage'ına kaydeder

2. **show_final.mcfunction** storage'dan NAME alır
   - Macro ile `$(NAME)` kullanarak doğru player'ı seçer
   - Dialog'u o player'a gösterir

## Kullanılan Storage Paths
- **Input:** `glc_menu:names temp.NAME` - player_name.mcfunction tarafından doldurulur
- **Output:** show_final.mcfunction tarafından `$(NAME)` macro değişkeni olarak kullanılır

## show_final.mcfunction (zaten mevcut)
```mcfunction
# Dialog Göster (Gerçek Gösterici)
$execute as $(NAME) at @s run dialog show @s $(ui)
```

Bu yapı sayesinde dialog doğru player'a gösterilir.
