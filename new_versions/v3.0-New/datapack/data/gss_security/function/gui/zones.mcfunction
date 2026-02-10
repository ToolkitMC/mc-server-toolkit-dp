# ═══════════════════════════════════════════════════════════════
# GSS Security Suite - Protected Zones GUI
# Zone yönetim menüsü (gelecek güncelleme)
# ═══════════════════════════════════════════════════════════════


# ═══════════════════════════════════════════════════
# GSS PROTECTED ZONES - BİLGİLENDİRME PANELİ
# ═══════════════════════════════════════════════════

# Loading ekranı
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 20

# Dialog JSON - Boşluksuz ve Optimize
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{text:"🛡️ Koruma Bölgeleri",color:"gold",bold:true},body:{type:"minecraft:plain_message",contents:"§e§oYakında Gelecek!\n\n§7Bu özellik henüz geliştirilme aşamasındadır.\n\n§8§lPlanlanan Özellikler:\n§8• Bölge (Zone) Oluşturma\n§8• Sınır Kontrolü\n§8• Yetki Yönetimi"},can_close_with_escape:true,pause:false,columns:1,actions:[]}

# Navigasyon Butonu
data modify storage mc:dialog ui.actions append value {label:"↩️ Ana Menüye Dön",width:290,action:{type:"minecraft:run_command",command:"/trigger gss.trigger"}}

# Geri Bildirim
execute if entity @s[tag=gulce_debug] run tellraw @s {"text":"[GSS] Zones bilgilendirme ekranı açıldı.","color":"aqua"}