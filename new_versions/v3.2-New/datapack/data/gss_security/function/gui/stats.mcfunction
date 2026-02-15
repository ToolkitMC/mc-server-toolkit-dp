# ═══════════════════════════════════════════════════
# GSS İSTATİSTİKLER - HATA DÜZELTİLDİ (Macro Fixed)
# ═══════════════════════════════════════════════════

# 1. VERİ TOPLAMA
execute store result score #suspicious_players gss.stats if entity @a[scores={gss.xray=75..}]
execute store result score #active_vision gss.stats if entity @a[tag=gulceos_permissions_admin,scores={gss.vision=1..}]

# 2. STORAGE TRANSFER (Nokta yerine Alt Çizgi kullanıldı!)
execute store result storage gss:temp stats_suspicious int 1 run scoreboard players get #suspicious_players gss.stats
execute store result storage gss:temp stats_my_score int 1 run scoreboard players get @s gss.xray
execute store result storage gss:temp stats_active_vision int 1 run scoreboard players get #active_vision gss.stats

# 3. LOADING EKRANI
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 20

# 4. DIALOG OLUŞTURMA (Değişken isimleri güncellendi)
$data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{text:"📊 Güvenlik İstatistikleri",color:"gold",bold:true},body:{type:"minecraft:plain_message",contents:"§8Powered by Bookshelf v3.2+\n\n§e§l🔍 Anti-Xray\n§7• Şüpheli Oyuncu: §c$(stats_suspicious)\n§7• Sizin Skorunuz: §e$(stats_my_score)\n\n§e§l👁️ Admin Vision\n§7• Aktif Admin: §b$(stats_active_vision)"},can_close_with_escape:true,pause:false,columns:1,actions:[]}

# 5. BUTONLAR
data modify storage mc:dialog ui.actions append value {label:"🔄 Verileri Güncelle",width:290,action:{type:"minecraft:run_command",command:"/function gss_security:gui/stats"}}
data modify storage mc:dialog ui.actions append value {label:"↩️ Ana Menüye Dön",width:290,action:{type:"minecraft:run_command",command:"/trigger gss.trigger"}}