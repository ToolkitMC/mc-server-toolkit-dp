# ═══════════════════════════════════════════════════════════════
# GSS Anti-Xray - Suspicious Player Detected
# ═══════════════════════════════════════════════════════════════

# Admin'lere bildirim gönder (Bookshelf log ile)
execute as @s run function #bs.log:warn { \
  namespace: "gss_security", \
  path: "gss_security:anti_xray/suspicious_detected", \
  tag: "anti_xray", \
  message: [{text:"Supheli davranis tespit edildi! Oyuncu: ",color:"yellow"},{selector:"@s",color:"red"},{text:" | Skor: ",color:"yellow"},{score:{name:"@s",objective:"gss.xray"},color:"red"}] \
}

# Oyuncunun ismini storage'a kaydet
data modify storage gss:anti_xray data.detected_players append from entity @s UUID

# Auto-freeze aktifse oyuncuyu dondur
execute if data storage gss:config {settings:{anti_xray:{auto_freeze:1b}}} run function custom:function/freeze_on

# Admin'lere görsel uyarı
execute as @a[tag=gulceos_permissions_admin] run title @s actionbar [{"text":"🚨 ","color":"red","bold":true},{"text":"X-Ray şüphesi: ","color":"yellow"},{"selector":"@s","color":"red"}]

# Particle efekti (admin'ler görebilir)
particle minecraft:angry_villager ~ ~2 ~ 0.3 0.5 0.3 0 10 force @a[tag=gulceos_permissions_admin]

# Skor sıfırla (her 5 dakikada)
schedule function gss_security:anti_xray/reset_scores 6000t
