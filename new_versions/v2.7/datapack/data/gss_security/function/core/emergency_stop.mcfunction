# ═══════════════════════════════════════════════════════════════
# GSS Security Suite - Acil Durdurma Protokolü
# Tüm güvenlik sistemlerini anında kapatır
# ═══════════════════════════════════════════════════════════════

# 1. TÜM SİSTEMLERİ STORAGE ÜZERİNDEN KAPAT
data modify storage gss:config settings.anti_xray.enabled set value 0b
data modify storage gss:config settings.admin_vision.enabled set value 0b
data modify storage gss:config settings.zones.enabled set value 0b

# 2. AKTİF SKORLARI VE MODLARI SIFIRLA
# Admin görüşlerini kapat
scoreboard players set @a gss.vision 0
# Mevcut X-Ray takip skorlarını temizle
scoreboard players set @a gss.xray 0

# 3. ZAMANLANMIŞ GÖREVLERİ (SCHEDULE) İPTAL ET
schedule clear gss_security:anti_xray/reset_scores

# 4. SİSTEM LOGLARI (Bookshelf Log Formatı)
function #bs.log:error { \
  namespace: "gss_security", \
  path: "gss_security:core/emergency_stop", \
  tag: "emergency", \
  message: '"ACİL DURDURMA! Tüm güvenlik sistemleri kapatıldı."' \
}

# 5. TÜM OYUNCULARA BİLDİRİM (Türkçe ve Görsel)
tellraw @a ["",{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red"},"\n",{"text":"🚨 ","color":"red","bold":true},{"text":"ACİL DURDURMA PROTOKOLÜ","color":"red","bold":true},"\n",{"text":"GSS Güvenlik Sistemleri tamamen kapatıldı.","color":"yellow"},"\n",{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red"}]

# 6. DRAMATİK SES EFEKTİ (Örs düşme sesi)
playsound minecraft:block.anvil.land master @a ~ ~ ~ 1 0.5
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 0.8 0.5