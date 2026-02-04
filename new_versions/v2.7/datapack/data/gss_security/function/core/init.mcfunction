# ═══════════════════════════════════════════════════════════════
# GSS Security Suite - Sistem Başlatma
# Powered by Bookshelf v3.2+
# ═══════════════════════════════════════════════════════════════

# Skor Tabloları
scoreboard objectives add gss.xray dummy "X-Ray Tespit Skoru"
scoreboard objectives add gss.vision dummy "Admin Görüşü Durumu"
scoreboard objectives add gss.stats dummy "Güvenlik İstatistikleri"
scoreboard objectives add gss.trigger trigger "GSS Menü"

# Storage (Depolama) Yapılandırması
data modify storage gss:config settings set value { \
  anti_xray: { \
    enabled: 1b, \
    max_score: 100, \
    scan_radius: 50.0d, \
    suspicious_threshold: 75, \
    auto_freeze: 0b \
  }, \
  admin_vision: { \
    enabled: 1b, \
    max_distance: 100.0d, \
    show_entities: 1b, \
    particle_type: "end_rod" \
  }, \
  logging: { \
    enabled: 1b, \
    auto_save: 1b, \
    max_history: 100 \
  }, \
  zones: { \
    enabled: 1b, \
    default_protection: 1b \
  } \
}

# Bookshelf Log Formatı Ayarla (Tam Türkçe Karakter Desteği)
data modify storage bs:const log.messages append value { \
  namespaces: ["gss_security"], \
  format: { \
    debug: ["",{"text":"[GSS-DEBUG] ","color":"gray"},{"nbt":"log.time_hmst","storage":"bs:const","interpret":true,"color":"dark_gray"}," ",{"nbt":"log.message","storage":"bs:in","interpret":true}], \
    info: ["",{"text":"🛡 [GSS] ","color":"aqua","bold":true},{"nbt":"log.time_hms","storage":"bs:const","interpret":true,"color":"gray"}," ",{"nbt":"log.message","storage":"bs:in","interpret":true}], \
    warn: ["",{"text":"⚠️ [GSS-UYARI] ","color":"yellow","bold":true},{"nbt":"log.time_hms","storage":"bs:const","interpret":true,"color":"gold"}," ",{"nbt":"log.message","storage":"bs:in","interpret":true}], \
    error: ["",{"text":"🚨 [GSS-HATA] ","color":"red","bold":true},{"nbt":"log.time_hms","storage":"bs:const","interpret":true,"color":"dark_red"}," ",{"nbt":"log.message","storage":"bs:in","interpret":true}] \
  } \
}

# İlk Log Kaydı
function #bs.log:info { \
  namespace: "gss_security", \
  path: "gss_security:core/init", \
  tag: "init", \
  message: '"GSS Security Suite yükleniyor..."' \
}

# Bağımlılık (Bookshelf) Kontrolü
execute store result score #bookshelf_version gss.stats run data get storage bs:ctx _.version
execute if score #bookshelf_version gss.stats matches 302.. run function #bs.log:info { \
  namespace: "gss_security", \
  path: "gss_security:core/init", \
  tag: "init", \
  message: '"Bookshelf v3.2+ tespit edildi ✅"' \
}

execute unless data storage bs:data load run function #bs.log:error { \
  namespace: "gss_security", \
  path: "gss_security:core/init", \
  tag: "init", \
  message: '"HATA: Bookshelf v3.2+ gerekli! Lütfen yükleyin: https://modrinth.com/datapack/bookshelf-dev"' \
}

execute unless data storage bs:data load run return 0

# Yetkilendirme (Permission Tags)
tag @a[tag=gulceos_permissions_admin] add gss_security.log._.info
tag @a[tag=gulceos_permissions_owner] add gss_security.log._.debug

# Alt Sistemleri Başlat
execute if data storage gss:config {settings:{anti_xray:{enabled:1b}}} run function gss_security:anti_xray/init
execute if data storage gss:config {settings:{admin_vision:{enabled:1b}}} run function gss_security:admin_vision/init
execute if data storage gss:config {settings:{zones:{enabled:1b}}} run function gss_security:zones/init

# Başarı Logu
function #bs.log:info { \
  namespace: "gss_security", \
  path: "gss_security:core/init", \
  tag: "init", \
  message: '"GSS Security Suite aktif! Kullanım: /trigger gss.trigger"' \
}

# Sohbet Bildirimi
tellraw @a ["",{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"},"\n",{"text":"  🛡 GSS Security Suite","color":"gold","bold":true},"\n",{"text":"  Destekleyen: ","color":"gray"},{"text":"Bookshelf v3.2+","color":"aqua"},"\n",{"text":"  Kullanım: ","color":"gray"},{"text":"/trigger gss.trigger","color":"yellow","clickEvent":{"action":"suggest_command","value":"/trigger gss.trigger"},"hoverEvent":{"action":"show_text","value":"Tıkla ve menüyü aç!"}},"\n",{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]

# Trigger Aktifleştirme
scoreboard players enable @a gss.trigger