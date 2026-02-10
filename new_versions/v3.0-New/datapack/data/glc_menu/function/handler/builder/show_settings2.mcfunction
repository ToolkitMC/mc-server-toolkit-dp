# ═══════════════════════════════════════════════════
# Ayarlar Menüsü (Dinamik Butonlar) - GELİŞTİRİLMİŞ
# ═══════════════════════════════════════════════════

# Loading göster
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 20

# Ayar menüsü JSON'ı hazırla
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{"text":"⚙️ Global Ayarlar","color":"gold","bold":true},body:{type:"minecraft:plain_message",contents:"§l§eSistem Ayarları\n\n§7Aktif/Pasif duruma göre butonlar değişir\n§7Yeşil = Açık | Kırmızı = Kapalı"},can_close_with_escape:true,pause:false,columns:1,actions:[]}

# ═══════════════════════════════════════════════════
# YÜKLEME SÜRESİ AYARI
# ═══════════════════════════════════════════════════
data modify storage mc:dialog ui.actions append value {label:"⏱️ Yükleme Süresi",width:290,action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"⏱️ Yükleme Süresi",body:{type:"minecraft:plain_message",contents:"§l§6Menü yükleme gecikmesi\n\n§7Dialog açılış süresini ayarlayın"},inputs:[{type:"minecraft:number_range",key:"load_second",label:"Süre (tick)",start:1,end:200,step:5,initial:30}],can_close_with_escape:true,pause:false,actions:[{label:"✅ Kaydet",action:{type:"minecraft:dynamic/run_command",template:"/data modify storage custom:storage config.load_second set value $(load_second)"}},{label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}}]}}}

# ═══════════════════════════════════════════════════
# İZİN SEVİYESİ AYARI
# ═══════════════════════════════════════════════════
data modify storage mc:dialog ui.actions append value {label:"🔐 İzin Seviyesi",width:290,action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔐 İzin Seviyesi Ayarla",body:{type:"minecraft:plain_message",contents:"§l§6Varsayılan izin seviyesi\n\n§71 = En düşük\n§75 = En yüksek"},can_close_with_escape:true,pause:false,columns:5,actions:[{label:"1",width:48,action:{type:"minecraft:run_command",command:"/data modify storage custom:storage config.level set value 1"}},{label:"2",width:48,action:{type:"minecraft:run_command",command:"/data modify storage custom:storage config.level set value 2"}},{label:"3",width:48,action:{type:"minecraft:run_command",command:"/data modify storage custom:storage config.level set value 3"}},{label:"4",width:48,action:{type:"minecraft:run_command",command:"/data modify storage custom:storage config.level set value 4"}},{label:"5",width:48,action:{type:"minecraft:run_command",command:"/data modify storage custom:storage config.level set value 5"}},{label:"◀️ Geri",width:240,action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}}]}}}

# ═══════════════════════════════════════════════════
# ELMAS → ZÜMRÜT TARİFİ (Dinamik)
# ═══════════════════════════════════════════════════
execute unless score #opt_diamond_recipe gulce_id matches 1 run data modify storage mc:dialog ui.actions append value {label:"💎 Elmas→Zümrüt: §cKapalı",width:290,action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"💎 Özel Tarif",body:{type:"minecraft:plain_message",contents:"§l§cŞu an kapalı\n\n§79 elmas = 1 zümrüt tarifini aktifleştirir"},can_close_with_escape:true,pause:false,actions:[{label:"✅ Aktifleştir",action:{type:"minecraft:run_command",command:"/data modify storage custom:storage config.diamond_to_emerald_recipe set value \"give\""}},{label:"◀️ İptal",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}}]}}}

execute if score #opt_diamond_recipe gulce_id matches 1 run data modify storage mc:dialog ui.actions append value {label:"💎 Elmas→Zümrüt: §aAçık",width:290,action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"💎 Özel Tarif",body:{type:"minecraft:plain_message",contents:"§l§aŞu an açık\n\n§7Tarifi devre dışı bırakmak ister misiniz?"},can_close_with_escape:true,pause:false,actions:[{label:"❌ Devre Dışı",action:{type:"minecraft:run_command",command:"/data modify storage custom:storage config.diamond_to_emerald_recipe set value \"take\""}},{label:"◀️ İptal",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}}]}}}

# ═══════════════════════════════════════════════════
# GLC MENU (Dinamik + Yenileme)
# ═══════════════════════════════════════════════════
execute unless score #opt_glc_menu gulce_id matches 1 run data modify storage mc:dialog ui.actions append value {label:"📋 GLC Menu: §cKapalı",width:290,action:{type:"minecraft:run_command",command:"/execute store result score #opt_glc_menu gulce_id run scoreboard players set #opt_glc_menu gulce_id 1"}}

execute if score #opt_glc_menu gulce_id matches 1 run data modify storage mc:dialog ui.actions append value {label:"📋 GLC Menu: §aAçık",width:290,action:{type:"minecraft:run_command",command:"/execute store result score #opt_glc_menu gulce_id run scoreboard players set #opt_glc_menu gulce_id 0"}}

# ═══════════════════════════════════════════════════
# ADMIN LOOP (Dinamik + Yenileme)
# ═══════════════════════════════════════════════════
execute unless score #opt_admin_loop gulce_id matches 1 run data modify storage mc:dialog ui.actions append value {label:"🔄 Admin Loop: §cKapalı",width:290,action:{type:"minecraft:run_command",command:"/execute store result score #opt_admin_loop gulce_id run scoreboard players set #opt_admin_loop gulce_id 1"}}

execute if score #opt_admin_loop gulce_id matches 1 run data modify storage mc:dialog ui.actions append value {label:"🔄 Admin Loop: §aAçık",width:290,action:{type:"minecraft:run_command",command:"/execute store result score #opt_admin_loop gulce_id run scoreboard players set #opt_admin_loop gulce_id 0"}}

# ═══════════════════════════════════════════════════
# TICK CONTROL (Dinamik + Yenileme)
# ═══════════════════════════════════════════════════
execute unless score #opt_tick gulce_id matches 1 run data modify storage mc:dialog ui.actions append value {label:"⏰ Tick Control: §cKapalı",width:290,action:{type:"minecraft:run_command",command:"/execute store result score #opt_tick gulce_id run scoreboard players set #opt_tick gulce_id 1"}}

execute if score #opt_tick gulce_id matches 1 run data modify storage mc:dialog ui.actions append value {label:"⏰ Tick Control: §aAçık",width:290,action:{type:"minecraft:run_command",command:"/execute store result score #opt_tick gulce_id run scoreboard players set #opt_tick gulce_id 0"}}

# ═══════════════════════════════════════════════════
# COOLDOWN (Dinamik + Yenileme)
# ═══════════════════════════════════════════════════
execute unless score #opt_cooldown gulce_id matches 1 run data modify storage mc:dialog ui.actions append value {label:"❄️ Cooldown: §cKapalı",width:290,action:{type:"minecraft:run_command",command:"/execute store result score #opt_cooldown gulce_id run scoreboard players set #opt_cooldown gulce_id 1"}}

execute if score #opt_cooldown gulce_id matches 1 run data modify storage mc:dialog ui.actions append value {label:"❄️ Cooldown: §aAçık",width:290,action:{type:"minecraft:run_command",command:"/execute store result score #opt_cooldown gulce_id run scoreboard players set #opt_cooldown gulce_id 0"}}

# ═══════════════════════════════════════════════════
# MAIN LOOP (Dinamik + Yenileme)
# ═══════════════════════════════════════════════════
execute unless score #opt_main_loop gulce_id matches 1 run data modify storage mc:dialog ui.actions append value {label:"🌐 Main Loop: §cKapalı",width:290,action:{type:"minecraft:run_command",command:"/execute store result score #opt_main_loop gulce_id run scoreboard players set #opt_main_loop gulce_id 1"}}

execute if score #opt_main_loop gulce_id matches 1 run data modify storage mc:dialog ui.actions append value {label:"🌐 Main Loop: §aAçık",width:290,action:{type:"minecraft:run_command",command:"/execute store result score #opt_main_loop gulce_id run scoreboard players set #opt_main_loop gulce_id 0"}}

# ═══════════════════════════════════════════════════
# ALT KISIM - AKSİYON BUTONLARI
# ═══════════════════════════════════════════════════

# Global ayarları uygula butonu
data modify storage mc:dialog ui.actions append value {label:"✅ Ayarları Kaydet & Uygula",width:290,action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"✅ Onayla",body:{type:"minecraft:plain_message",contents:"§l§aTüm ayarlar kaydedilip uygulanacak!\n\n§7Bu işlem:\n§7• Scoreboard değerlerini set eder\n§7• Sistem bayraklarını günceller\n§7• Loop'ları yeniden başlatır"},can_close_with_escape:true,pause:false,actions:[{label:"✅ Uygula",action:{type:"minecraft:run_command",command:"/function main:apply_settings"}},{label:"🔄 Menüyü Yenile",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}},{label:"❌ Vazgeç",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}]}}}

# Ayarları sıfırla butonu
data modify storage mc:dialog ui.actions append value {label:"🔄 Varsayılana Sıfırla",width:290,action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"🔄 Sıfırlama",body:{type:"minecraft:plain_message",contents:"§l§6Tüm ayarlar sıfırlanacak!\n\n§7Varsayılan değerler:\n§7• Tüm sistemler: Açık\n§7• İzin seviyesi: 1\n§7• Yükleme süresi: 30 tick"},can_close_with_escape:true,pause:false,actions:[{label:"✅ Sıfırla",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/utils/reset_settings"}},{label:"❌ İptal",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}}]}}}

# ═══════════════════════════════════════════════════
# NAVİGASYON BUTONLARI
# ═══════════════════════════════════════════════════

# Geri butonu
data modify storage mc:dialog ui.actions append value {label:"◀️ Ana Menü",width:290,action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}

# Yenile butonu
data modify storage mc:dialog ui.actions append value {label:"🔄 Menüyü Yenile",width:290,action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}}

# ═══════════════════════════════════════════════════
# KRİTİK İŞLEMLER
# ═══════════════════════════════════════════════════

# Sistemleri devre dışı bırak (Geliştirilmiş uyarı)
data modify storage mc:dialog ui.actions append value {label:{text:"⚠️ TÜM SİSTEMLERİ KAPAT",color:"dark_red",bold:true},width:290,action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:{text:"⚠️ SON UYARI",color:"dark_red",bold:true},body:{type:"minecraft:plain_message",contents:"§l§4TÜM SİSTEMLER TAMAMEN KAPANACAK!\n\n§c⚠️ Bu işlem:\n§7• Tüm loop'ları durdurur\n§7• Menü sistemini kapatır\n§7• İzin kontrollerini devre dışı bırakır\n§7• Cooldown sistemini kapatır\n\n§e📌 Tekrar açmak için:\n§e/function gulce_adminpower_addons:reload/1\n\n§4Bu işlem GERİ ALINAMAZ!"},can_close_with_escape:true,pause:false,actions:[{label:{text:"🔴 EVET, HEPSİNİ KAPAT",color:"red",bold:true},action:{type:"minecraft:run_command",command:"/function vc_experimental:disable_all"}},{label:"❌ HAYIR, VAZGEÇ",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}}]}}}

# ═══════════════════════════════════════════════════
# DEBUG BİLGİSİ (Opsiyonel - Yorum satırı olarak bırakılabilir)
# ═══════════════════════════════════════════════════
tellraw @s [{"text":"[DEBUG] ","color":"gray"},{"text":"Ayarlar menüsü yüklendi","color":"white"}]
tellraw @s [{"text":"[SCORES] ","color":"yellow"},{"score":{"name":"#opt_glc_menu","objective":"gulce_id"}},{"text":" | "},{"score":{"name":"#opt_admin_loop","objective":"gulce_id"}},{"text":" | "},{"score":{"name":"#opt_tick","objective":"gulce_id"}}]