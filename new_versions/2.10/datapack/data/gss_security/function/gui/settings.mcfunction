# ═══════════════════════════════════════════════════
# GSS SETTINGS - COMPACT DIALOG SYSTEM
# ═══════════════════════════════════════════════════
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 20

# Mevcut ayarları skorlara çek
execute store result score #anti_xray_enabled gss.stats run data get storage gss:config settings.anti_xray.enabled
execute store result score #admin_vision_enabled gss.stats run data get storage gss:config settings.admin_vision.enabled
execute store result score #zones_enabled gss.stats run data get storage gss:config settings.zones.enabled
execute store result score #auto_freeze gss.stats run data get storage gss:config settings.anti_xray.auto_freeze
execute store result score #threshold gss.stats run data get storage gss:config settings.anti_xray.suspicious_threshold

# Ana Panel Hazırlığı
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{text:"⚙️ GSS Ayarlar",color:"gold",bold:true},body:{type:"minecraft:plain_message",contents:"§7Gelişmiş güvenlik yapılandırma paneli.\n§8Powered by Bookshelf v3.2+"},can_close_with_escape:true,pause:false,columns:1,actions:[]}

# --- ANTI-XRAY BÖLÜMÜ ---
execute if score #anti_xray_enabled gss.stats matches 1 run data modify storage mc:dialog ui.actions append value {label:"🛡 Anti-Xray: §aAKTİF",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:settings/toggle_antixray"}}
execute if score #anti_xray_enabled gss.stats matches 0 run data modify storage mc:dialog ui.actions append value {label:"🛡 Anti-Xray: §cKAPALI",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:settings/toggle_antixray"}}

execute if score #auto_freeze gss.stats matches 1 run data modify storage mc:dialog ui.actions append value {label:"❄️ Auto-Freeze: §aAÇIK",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:settings/toggle_autofreeze"}}
execute if score #auto_freeze gss.stats matches 0 run data modify storage mc:dialog ui.actions append value {label:"❄️ Auto-Freeze: §cKAPALI",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:settings/toggle_autofreeze"}}

# Eşik Değeri (Threshold) Düzenleme
data modify storage mc:dialog ui.actions append value {label:"📊 Eşik Değeri Ayarla",width:290,action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"📊 Eşik Değeri",body:{type:"minecraft:plain_message",contents:"§7Şu anki değer: §e$(#threshold)\n§7X-Ray tespiti için hassasiyeti belirleyin."},inputs:[{type:"minecraft:number_range",key:"val",label:"Yeni Değer",start:1,end:500,initial:75}],actions:[{label:"✅ Kaydet",action:{type:"minecraft:dynamic/run_command",template:"/function gss_security:settings/set_threshold {value:$(val)}"}},{label:"◀️ Geri",action:{type:"minecraft:run_command",command:"/function gss_security:gui/settings"}}]}}}

# --- ADMIN VISION & ZONES ---
execute if score #admin_vision_enabled gss.stats matches 1 run data modify storage mc:dialog ui.actions append value {label:"👁 Admin Vision: §aAKTİF",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:settings/toggle_adminvision"}}
execute if score #admin_vision_enabled gss.stats matches 0 run data modify storage mc:dialog ui.actions append value {label:"👁 Admin Vision: §cKAPALI",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:settings/toggle_adminvision"}}

execute if score #zones_enabled gss.stats matches 1 run data modify storage mc:dialog ui.actions append value {label:"🛡 Zones: §aAKTİF",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:settings/toggle_zones"}}
execute if score #zones_enabled gss.stats matches 0 run data modify storage mc:dialog ui.actions append value {label:"🛡 Zones: §cKAPALI",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:settings/toggle_zones"}}

# --- HIZLI EYLEMLER & NAVİGASYON ---
data modify storage mc:dialog ui.actions append value {label:"🔄 Skorları Sıfırla",width:140,action:{type:"minecraft:run_command",command:"/function gss_security:settings/reset_all_scores"}}
data modify storage mc:dialog ui.actions append value {label:"📂 Config Dökümü",width:140,action:{type:"minecraft:run_command",command:"/function #bs.dump:var {var:'storage gss:config settings'}"}}

data modify storage mc:dialog ui.actions append value {label:"↩ Ana Menü",width:140,action:{type:"minecraft:run_command",command:"/trigger gss.trigger"}}
data modify storage mc:dialog ui.actions append value {label:{text:"🚨 ACİL KAPAT",color:"dark_red",bold:true},width:140,action:{type:"minecraft:run_command",command:"/function gss_security:core/emergency_stop"}}

# Ses Efekti
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1.5