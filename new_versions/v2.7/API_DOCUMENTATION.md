# 📚 GulceOS VanillaControl - API Dokümantasyonu

> **Versiyon:** v2.7  
> **API Level:** 2  
> **Son Güncelleme:** Şubat 2026  
> **Hedef Kitle:** Datapack geliştiricileri, addon yaratıcıları

---

## 📑 İçindekiler

1. [Genel Bakış](#-genel-bakış)
2. [Temel Kavramlar](#-temel-kavramlar)
3. [Storage API](#-storage-api)
4. [Function API](#-function-api)
5. [Scoreboard API](#-scoreboard-api)
6. [Predicate API](#-predicate-api)
7. [Dialog (GUI) API](#-dialog-gui-api)
8. [Event System](#-event-system)
9. [Security API](#-security-api)
10. [Bookshelf Entegrasyonu](#-bookshelf-entegrasyonu)
11. [Addon Geliştirme](#-addon-geliştirme)
12. [Best Practices](#-best-practices)
13. [Debugging](#-debugging)

---

## 🌐 Genel Bakış

### API Felsefesi

GulceOS VanillaControl, **modüler**, **genişletilebilir** ve **performanslı** bir API sunar. Tüm sistemler birbirinden bağımsız çalışabilir ve kolay entegre edilebilir.

### Temel Prensipler

1. **Namespace İzolasyonu**: Her modül kendi namespace'inde çalışır
2. **Storage Merkezi Yönetim**: Tüm veriler NBT storage'da saklanır
3. **Event-Driven Architecture**: Callback ve hook sistemi
4. **Bookshelf Uyumlu**: Tüm Bookshelf modülleri kullanılabilir
5. **Geriye Uyumlu**: Eski API'lar desteklenir

### Versiyon Şeması

```
v2.7
 │ │
 │ └─ Minor (Yeni özellik, geriye uyumlu)
 └─── Major (Breaking change)
```

### Minimum Gereksinimler

- **Minecraft:** 1.21.7+
- **Bookshelf:** v3.2.0+
- **Command Block:** Enabled
- **Send Feedback:** Enabled

---

## 💡 Temel Kavramlar

### Namespace Sistemi

GulceOS şu namespace'leri kullanır:

```
gss_security:     Güvenlik modülleri (anti-xray, admin vision)
custom_admin:     Admin araçları ve komutları
custom:           Genel oyuncu özellikleri
glc_menu:         Menü sistemi
actions:          Eylem yönetimi
admin:            Admin komutları (home, spawn)
cooldown:         Cooldown sistemi
cooldown2:        Alternatif cooldown
main:             Ana sistem
global:           Global fonksiyonlar
```

### Tag Sistemi

Oyuncu yetkileri tag'lerle yönetilir:

```mcfunction
# Yetki Tag'leri
admin           - Admin yetkisi
owner           - Tam yetki
mod             - Moderatör
builder         - Builder
player          - Varsayılan

# İzin Tag'leri
perm.namespace.category.action

# Örnekler:
perm.custom.gamemode.creative
perm.custom.time.set
perm.gss.admin_vision.use
```

### Storage Konvansiyonu

Tüm storage'lar şu formatta:

```mcfunction
storage <namespace>:<path> <data>

# Örnekler:
storage gss:config settings
storage gss:anti_xray data
storage custom_admin:permissions groups
```

---

## 🗄️ Storage API

### Config Storage (gss:config)

Ana yapılandırma merkezi.

#### Yapı

```json
{
  "settings": {
    "anti_xray": {
      "enabled": 1b,
      "max_score": 100,
      "scan_radius": 50.0d,
      "suspicious_threshold": 75,
      "auto_freeze": 0b
    },
    "admin_vision": {
      "enabled": 1b,
      "max_distance": 100.0d,
      "show_entities": 1b,
      "particle_type": "end_rod"
    },
    "logging": {
      "enabled": 1b,
      "auto_save": 1b,
      "max_history": 100
    }
  }
}
```

#### Okuma

```mcfunction
# Tek değer okuma
execute store result score #enabled temp run data get storage gss:config settings.anti_xray.enabled

# Tüm config'i okuma
data get storage gss:config settings
```

#### Yazma

```mcfunction
# Tek değer yazma
data modify storage gss:config settings.anti_xray.max_score set value 150

# Merge (birleştirme)
data modify storage gss:config settings.anti_xray merge value {enabled: 1b, max_score: 200}

# Array'e ekleme
data modify storage gss:config settings.modules append value "new_module"
```

#### Varsayılan Değerlere Döndürme

```mcfunction
function gss_security:core/init
# veya
data remove storage gss:config settings
function main:load
```

### Anti-Xray Storage (gss:anti_xray)

Tespit verileri saklanır.

#### Yapı

```json
{
  "data": {
    "players": [
      {
        "uuid": "123e4567-e89b-12d3-a456-426614174000",
        "name": "TestPlayer",
        "suspicious_count": 15,
        "last_detection": 1234567890,
        "score": 75
      }
    ],
    "detections": [
      {
        "timestamp": 1234567890,
        "player": "TestPlayer",
        "block": "diamond_ore",
        "location": [100, 64, 200]
      }
    ]
  }
}
```

### Permissions Storage (custom_admin:permissions)

İzin ve grup verileri.

#### Yapı

```json
{
  "groups": [
    {
      "name": "admin",
      "permissions": [
        "custom.gamemode.creative",
        "custom.time.set",
        "gss.admin_vision.use"
      ],
      "members": [
        "PlayerOne",
        "PlayerTwo"
      ]
    }
  ]
}
```

#### API Fonksiyonları

```mcfunction
# Grup oluştur
function custom_admin:group/create {id:"<ID>",name:"<AD>",priority:<Öncelik>}

# Grup'a üye ekle
function custom_admin:group/add_member {"group_id":"<ID>","player":"<OYUNCU ADI>"}

# Grup'a izin ekle
function custom_admin:group/add_permission {"group_id":"<ID>",permission:"<İZİN>",level:<SEVİYE>}

# Grup bilgisi al
function custom_admin:group/info {id:"<ID>"}

# Tag'leri yenile (izinleri uygula)
function custom_admin:group/tag_refresh
```

### Temp Storage (gss:temp)

Geçici veriler için. Her tick temizlenir (opsiyonel).

```mcfunction
# Geçici veri sakla
data modify storage gss:temp current_player set from entity @s

# Macro için veri hazırla
data modify storage gss:temp macro_data set value {value: 10}

# Kullan
function my_namespace:my_function with storage gss:temp macro_data
```

---

## 🔧 Function API

### Hook Sistemi

GulceOS event-driven çalışır. Function tag'leri ile hook oluşturabilirsiniz.

#### Load Hook

Datapack yüklendiğinde çalışır.

```mcfunction
# data/mypack/tags/function/load.json
{
  "values": [
    "mypack:init"
  ]
}

# data/mypack/function/init.mcfunction
say MyPack loaded!
scoreboard objectives add mypack.data dummy
```

#### Tick Hook

Her tick çalışır.

```mcfunction
# data/mypack/tags/function/tick.json
{
  "values": [
    "mypack:tick"
  ]
}

# data/mypack/function/tick.mcfunction
execute as @a[tag=special] run function mypack:special_player_tick
```

#### Custom Hook'lar

GulceOS'un kendi hook'ları:

```mcfunction

# Admin Vision toggle sonrası
gss_security:admin_vision/toggle

# Eylem ekleme (İzin sistemi)
/function custom_admin:add/action_<EYLEM> <DEĞİŞKENLER>
```

**Kullanım örneği:**

```mcfunction
# data/mypack/tags/function/on_xray_detect.json
{
  "values": [
    "mypack:handle_xray"
  ]
}

# data/mypack/function/handle_xray.mcfunction
# Şüpheli oyuncu @s olarak gelir
execute if score @s gss.xray matches 100.. run function mypack:auto_ban
```

### Macro Sistemi

Minecraft 1.20.2+ macro desteği kullanılır.

#### Basit Macro

```mcfunction
# function mypack:give_item.mcfunction
$give @s $(item) $(count)

# Kullanım:
data modify storage mypack:temp macro set value {item: "diamond", count: 64}
function mypack:give_item with storage mypack:temp macro
```

#### Gelişmiş Macro - Custom Admin'den Örnek

```mcfunction
# custom:tools/kick/macro.mcfunction
$kick $(player) $(reason)

# Kullanım:
data modify storage custom_admin:temp kick_data set value {player: "Hacker123", reason: "X-Ray",...}
function custom:tools/kick/macro with storage custom_admin:temp kick_data
```

### Execute Chain Optimizasyonu

```mcfunction
# ❌ KÖTÜ - Her oyuncu için ayrı execute
execute as @a run function mypack:check_permission
execute as @a run function mypack:update_stats

# ✅ İYİ - Birleştirilmiş
execute as @a run function mypack:player_tick

# mypack:player_tick içinde:
function mypack:check_permission
function mypack:update_stats
```

---

## 📊 Scoreboard API

### Sistem Scoreboard'ları

```mcfunction
# Güvenlik
gss.xray         - Anti-Xray şüphe skoru (0-100)
gss.vision       - Admin Vision durumu (0=kapalı, 1=açık)
gss.stats        - İstatistik hesaplamaları
gss.trigger      - Menü açma trigger

# Genel
temp             - Geçici hesaplamalar (her zaman mevcut)
const            - Sabitler (-1, 0, 1, 2, 10, 100 vb.)
```

### Scoreboard Oluşturma

```mcfunction
# Init fonksiyonunda
scoreboard objectives add mypack.data dummy
scoreboard objectives add mypack.trigger trigger

# Trigger enable (her oyuncu için)
scoreboard players enable @a mypack.trigger
```

### Scoreboard Operations

```mcfunction
# Atama
scoreboard players set @s mypack.data 10

# Artırma
scoreboard players add @s mypack.data 1

# Azaltma
scoreboard players remove @s mypack.data 1

# Operasyon
scoreboard players operation @s mypack.data += @s mypack.other

# Sıfırlama
scoreboard players reset @s mypack.data
```

### Scoreboard ile Koşullar

```mcfunction
# Eşitlik
execute if score @s mypack.data matches 10 run say Değer 10!

# Aralık
execute if score @s mypack.data matches 1..10 run say 1 ile 10 arası!

# Karşılaştırma
execute if score @s mypack.data > #threshold const run say Eşik aşıldı!

# Negatif kontrolü
execute unless score @s mypack.data matches 1.. run say Sıfır veya negatif!
```

### Trigger Kullanımı

```mcfunction
# Trigger tanımla
scoreboard objectives add mypack.action trigger

# Enable et (tick'te)
scoreboard players enable @a mypack.action

# Dinle
execute as @a[scores={mypack.action=1}] run function mypack:action1
execute as @a[scores={mypack.action=2}] run function mypack:action2

# Sıfırla (kullanıldıktan sonra)
scoreboard players reset @a[scores={mypack.action=1..}] mypack.action
```

---

## 🎯 Predicate API

### Predicate Yapısı

Predicates, `execute if predicate` ile kullanılır.

#### Basit Predicate

```json
// data/mypack/predicate/is_admin.json
{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "nbt": "{Tags:[\"admin\"]}"
  }
}
```

**Kullanım:**
```mcfunction
execute if predicate mypack:is_admin run say Admin!
```

#### Composite Predicate (Birleşik)

```json
// data/mypack/predicate/can_build.json
{
  "condition": "minecraft:alternative",
  "terms": [
    {
      "condition": "minecraft:entity_properties",
      "entity": "this",
      "predicate": {
        "nbt": "{Tags:[\"admin\"]}"
      }
    },
    {
      "condition": "minecraft:entity_properties",
      "entity": "this",
      "predicate": {
        "nbt": "{Tags:[\"builder\"]}"
      }
    }
  ]
}
```

**Kullanım:**
```mcfunction
execute if predicate mypack:can_build run function mypack:allow_build
execute unless predicate mypack:can_build run tellraw @s {"text":"İzniniz yok!","color":"red"}
```

#### GulceOS Predicate'leri

```mcfunction
# Panel kullanma izni
actions:can_use_panel

# Admin izinleri (parçalara bölünmüş)
adminpower_predicates:part_1
adminpower_predicates:part_2
# ... part_14'e kadar

# Cooldown kontrolü
custom_admin:cooldown
```

### Predicate ile İzin Kontrolü

```mcfunction
# Özel izin predicate'i oluştur
# data/mypack/predicate/perm_time_set.json
{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "nbt": "{Tags:[\"perm.custom.time.set\"]}"
  }
}

# Kullan
execute if predicate mypack:perm_time_set run time set day
execute unless predicate mypack:perm_time_set run tellraw @s {"text":"Bu komutu kullanamazsınız!","color":"red"}
```

---

## 🖥️ Dialog (GUI) API

GulceOS, 1.21.6'in dialog sistemini kullanır.

### Basit Dialog

```json
// data/custom/dialog/admin_menu.json
{
  "type": "minecraft:multi_action",
  "title": {
    "text": "⚙️ GULCE ",
    "extra": [
      {
        "text": "- ",
        "color": "yellow",
        "bold": true,
        "italic": false
      },
      {
        "text": "Admin Power ",
        "color": "green",
        "bold": true,
        "italic": false
      },
      {
        "text": "Kontrol Paneli",
        "color": "gold",
        "bold": true,
        "italic": false
      }
    ],
    "color": "aqua",
    "bold": true,
    "italic": false
  },
  "body": {
    "type": "minecraft:plain_message",
    "contents": "§l§9⚡ Hoşgeldin! Panelden araçları seçebilirsin.\n\n§l§a📝 NBT düzenleme, komut yürütme, mesaj gönderme ve daha fazlası."
  },
  "can_close_with_escape": true,
  "pause": false,
  "exit_action": {
    "label": "❌ Kapat",
    "action": {
      "type": "minecraft:suggest_command",
      "command": "/say Panel kapatılıyor..."
    }
  },
  "actions": [
    {
      "label": "🧩 NBT / Dosya Düzenle",
      "action": {
        "type": "minecraft:show_dialog",
        "dialog": {
          "type": "minecraft:multi_action",
          "title": "🧩 NBT / Dosya Düzenleme",
          "inputs": [
            {
              "type": "minecraft:text",
              "key": "str",
              "label": "📁 Dosya Adı (namespace:path)",
              "max_length": 100000000
            },
            {
              "type": "minecraft:text",
              "key": "so",
              "label": "🔊 Ses Efekti",
              "max_length": 5000
            },
            {
              "type": "minecraft:text",
              "key": "mn",
              "label": "📝 Düzenlenecek NBT",
              "max_length": 10000000
            },
            {
              "type": "minecraft:text",
              "key": "ac",
              "label": "⚡ İşlem Tipi (Örnek: value [])",
              "max_length": 10000000
            },
            {
              "type": "minecraft:text",
              "key": "nbt",
              "label": "📦 NBT Değeri",
              "max_length": 100000000
            },
            {
              "type": "minecraft:text",
              "key": "p",
              "label": "🎯 Oyuncu",
              "max_length": 50000
            }
          ],
          "can_close_with_escape": true,
          "pause": false,
          "actions": [
            {
              "label": "💾 Kaydet ve Uygula",
              "action": {
                "type": "minecraft:dynamic/run_command",
                "template": "/function actions:modify_file {File:\"$(str)\",Player:\"$(p)\",sound:\"$(so)\",NBT:\"$(nbt)\",Action:\"$(ac)\",Modify_NBT:\"$(mn)\"}"
              }
            }
          ]
        }
      }
    },
    {
      "label": "⚙️ Komut Yürüt",
      "action": {
        "type": "minecraft:show_dialog",
        "dialog": {
          "type": "minecraft:multi_action",
          "title": "⚙️ Komut Yürütücü",
          "inputs": [
            {
              "type": "minecraft:text",
              "key": "s",
              "label": "🔊 Ses (opsiyonel)",
              "max_length": 100000000
            },
            {
              "type": "minecraft:text",
              "key": "cmd",
              "label": "💻 Komut",
              "max_length": 100000000
            },
            {
              "type": "minecraft:text",
              "key": "p",
              "label": "🎯 Oyuncu Adı",
              "max_length": 100000000
            }
          ],
          "can_close_with_escape": true,
          "pause": false,
          "actions": [
            {
              "label": "🚀 Yürüt",
              "action": {
                "type": "minecraft:dynamic/run_command",
                "template": "/function actions:run_command {\"run\":'$(cmd)',\"player\":\"$(p)\",\"sound\":\"$(s)\"}"
              }
            },
            {
              "label": "❌ Kapat",
              "action": {
                "type": "minecraft:suggest_command",
                "command": "/say Komut yürütme kapatıldı."
              }
            }
          ]
        }
      }
    },
    {
      "label": "💬 Mesaj Gönder",
      "action": {
        "type": "minecraft:show_dialog",
        "dialog": {
          "type": "minecraft:multi_action",
          "title": "💬 Mesaj Gönderici",
          "inputs": [
            {
              "type": "minecraft:text",
              "key": "s",
              "label": "🔊 Ses",
              "max_length": 100000000
            },
            {
              "type": "minecraft:text",
              "key": "msg",
              "label": "💬 Mesaj",
              "max_length": 100000000
            },
            {
              "type": "minecraft:text",
              "key": "p",
              "label": "🎯 Oyuncu",
              "max_length": 100000000
            }
          ],
          "can_close_with_escape": true,
          "pause": false,
          "actions": [
            {
              "label": "📨 Gönder",
              "action": {
                "type": "minecraft:dynamic/run_command",
                "template": "/function actions:send_msg {\"player\":\"$(p)\",\"msg\":\"$(msg)\",\"sound\":\"$(s)\"}"
              }
            },
            {
              "label": "❌ Kapat",
              "action": {
                "type": "minecraft:suggest_command",
                "command": "/say Mesaj gönderme iptal edildi."
              }
            }
          ]
        }
      }
    },
    {
      "label": "🎯 Oyuncu Işınla",
      "action": {
        "type": "minecraft:show_dialog",
        "dialog": {
          "type": "minecraft:multi_action",
          "title": "🎯 Oyuncu Işınlama",
          "inputs": [
            {
              "type": "minecraft:text",
              "key": "from",
              "label": "🚹 Kaynak Oyuncu",
              "max_length": 100000000
            },
            {
              "type": "minecraft:text",
              "key": "to",
              "label": "🎯 Hedef Oyuncu veya Koordinat (~ ~ ~)",
              "max_length": 100000000
            },
            {
              "type": "minecraft:text",
              "key": "s",
              "label": "🔊 Ses Efekti",
              "max_length": 10000000
            }
          ],
          "can_close_with_escape": true,
          "pause": false,
          "actions": [
            {
              "label": "🚀 Işınla",
              "action": {
                "type": "minecraft:dynamic/run_command",
                "template": "/function actions:teleport {Player1:\"$(from)\",Player2:\"$(to)\",sound:\"$(s)\",player:\"@s\"}"
              }
            },
            {
              "label": "❌ Kapat",
              "action": {
                "type": "minecraft:suggest_command",
                "command": "/say Işınlama iptal edildi."
              }
            }
          ]
        }
      }
    },
    {
      "label": "🧨 Varlık / Efekt Oluştur",
      "action": {
        "type": "minecraft:show_dialog",
        "dialog": {
          "type": "minecraft:multi_action",
          "title": "🧨 Varlık veya Efekt Oluştur",
          "inputs": [
            {
              "type": "minecraft:text",
              "key": "ent",
              "label": "🔹 Varlık ID (örn: minecraft:zombie)",
              "max_length": 100000000
            },
            {
              "type": "minecraft:text",
              "key": "nbt",
              "label": "📦 NBT Verisi",
              "initial": "{}",
              "max_length": 100000000
            },
            {
              "type": "minecraft:text",
              "key": "loc",
              "label": "📍 Konum (~ ~ ~)",
              "max_length": 100000000
            },
            {
              "type": "minecraft:text",
              "key": "s",
              "label": "🔊 Ses Efekti",
              "max_length": 100000000
            }
          ],
          "can_close_with_escape": true,
          "pause": false,
          "actions": [
            {
              "label": "🧨 Oluştur",
              "action": {
                "type": "minecraft:dynamic/run_command",
                "template": "/function actions:spawn_entity {Entity:\"$(ent)\",NBT:\"$(nbt)\",Pos:\"$(loc)\",sound:\"$(s)\",player:\"@s\"}"
              }
            },
            {
              "label": "❌ Kapat",
              "action": {
                "type": "minecraft:suggest_command",
                "command": "/say Varlık/efekt oluşturma iptal edildi."
              }
            }
          ]
        }
      }
    },
    {
      "label": "📢 Başlık Göster",
      "action": {
        "type": "minecraft:show_dialog",
        "dialog": {
          "type": "minecraft:multi_action",
          "title": "📢 Başlık / Actionbar Gönderici",
          "inputs": [
            {
              "type": "minecraft:text",
              "key": "txt",
              "label": "📝 Metin",
              "max_length": 100000000
            },
            {
              "type": "minecraft:single_option",
              "key": "typ",
              "label": "Tür",
              "options": [
                {
                  "id": "title",
                  "display": "Başlık"
                },
                {
                  "id": "actionbar",
                  "display": "Actionbar"
                },
                {
                  "id": "subtitle",
                  "display": "Alt Başlık"
                }
              ]
            },
            {
              "type": "minecraft:text",
              "key": "u",
              "label": "🎯 Hedef Oyuncu",
              "max_length": 5000000
            },
            {
              "type": "minecraft:text",
              "key": "co",
              "label": "🎨 Renk (örn: yellow veya #ffaa00)",
              "max_length": 5555555
            },
            {
              "type": "minecraft:boolean",
              "key": "bol",
              "label": "🟨 Kalın (bold)"
            },
            {
              "type": "minecraft:boolean",
              "key": "it",
              "label": "🟪 İtalik (italic)"
            },
            {
              "type": "minecraft:boolean",
              "key": "und",
              "label": "🟩 Altı Çizili (underlined)"
            },
            {
              "type": "minecraft:boolean",
              "key": "str",
              "label": "🟥 Üstü Çizili (strikethrough)"
            },
            {
              "type": "minecraft:boolean",
              "key": "obf",
              "label": "🌀 Karışık (obfuscated)"
            }
          ],
          "can_close_with_escape": true,
          "pause": false,
          "actions": [
            {
              "label": "✅ Gönder",
              "action": {
                "type": "minecraft:dynamic/run_command",
                "template": "/title $(u) $(typ) {\"text\":\"$(txt)\",\"color\":\"$(co)\",\"bold\":$(bol),\"italic\":$(it),\"underlined\":$(und),\"strikethrough\":$(str),\"obfuscated\":$(obf)}"
              }
            }
          ]
        }
      }
    },
    {
      "label": "🎮 Oyun Modu Değiştir",
      "action": {
        "type": "minecraft:show_dialog",
        "dialog": {
          "type": "minecraft:multi_action",
          "title": "🎮 Oyun Modu Değiştir",
          "inputs": [
            {
              "type": "minecraft:text",
              "key": "s",
              "label": "🔊 Ses Efekti",
              "max_length": 1000000
            },
            {
              "type": "minecraft:single_option",
              "key": "mod",
              "label": "🎮 Oyun Modu Seç",
              "options": [
                {
                  "id": "creative",
                  "display": "Yaratıcı"
                },
                {
                  "id": "survival",
                  "display": "Hayatta Kalma"
                },
                {
                  "id": "spectator",
                  "display": "Gözlemci"
                },
                {
                  "id": "adventure",
                  "display": "Macera"
                }
              ]
            },
            {
              "type": "minecraft:text",
              "key": "pl",
              "label": "🎯 Oyuncu",
              "max_length": 1000000
            }
          ],
          "can_close_with_escape": true,
          "pause": false,
          "actions": [
            {
              "label": "✅ Değiştir",
              "action": {
                "type": "minecraft:dynamic/run_command",
                "template": "/function actions:gamemode_change {mode:\"$(mod)\",player:\"$(pl)\",sound:\"$(s)\"}"
              }
            }
          ]
        }
      }
    },
    {
      "label": "🎨 GUI Aç",
      "action": {
        "type": "minecraft:show_dialog",
        "dialog": {
          "type": "minecraft:multi_action",
          "title": "🎨 GUI Aç",
          "inputs": [
            {
              "type": "minecraft:text",
              "key": "GUI",
              "label": "🖼️ Dialog JSON",
              "max_length": 1000000000
            },
            {
              "type": "minecraft:single_option",
              "key": "p",
              "label": "🎯 Hedef Oyuncu",
              "options": [
                {
                  "id": "@a"
                },
                {
                  "id": "@p"
                },
                {
                  "id": "@s"
                }
              ]
            }
          ],
          "actions": [
            {
              "label": "✅ Aç",
              "action": {
                "type": "minecraft:dynamic/run_command",
                "template": "/function actions:open_gui {dialog:'$(GUI)',player:\"$(p)\"}"
              }
            },
            {
              "label": "❌ Kapat",
              "action": {
                "type": "minecraft:suggest_command",
                "command": "/say GUI açma iptal edildi."
              }
            }
          ]
        }
      }
    },
    {
      "label": "ℹ️ Hızlı Bilgi / Uyarı",
      "action": {
        "type": "minecraft:show_dialog",
        "dialog": {
          "type": "minecraft:multi_action",
          "title": "ℹ️ Hızlı Bilgi / Uyarı",
          "inputs": [
            {
              "type": "minecraft:text",
              "key": "Contents",
              "label": "📄 Mesaj İçeriği",
              "initial": "{\"text\": \"\",\"color\": \"white\",\"italic\": false}",
              "max_length": 100000000
            },
            {
              "type": "minecraft:single_option",
              "key": "p",
              "label": "🎯 Hedef Oyuncu",
              "options": [
                {
                  "id": "@a"
                },
                {
                  "id": "@p"
                },
                {
                  "id": "@r"
                },
                {
                  "id": "@s"
                }
              ]
            }
          ],
          "can_close_with_escape": true,
          "pause": false,
          "actions": [
            {
              "label": "✅ Göster",
              "action": {
                "type": "minecraft:dynamic/run_command",
                "template": "/function custom:run {cmd:\"dialog show $(p) { \\\"type\\\": \\\"minecraft:notice\\\", \\\"title\\\": \\\"\\\", \\\"body\\\": { \\\"type\\\": \\\"minecraft:plain_message\\\", \\\"contents\\\": [$(Contents)] }, \\\"can_close_with_escape\\\": true, \\\"pause\\\": false, \\\"action\\\": { \\\"label\\\": \\\"Geri\\\", \\\"action\\\": { \\\"type\\\": \\\"minecraft:run_command\\\", \\\"command\\\": \\\"/function actions:menu/open\\\" } } }\"}"
              }
            }
          ]
        }
      }
    },
    {
      "label": "🐼 Panda Oluştur",
      "action": {
        "type": "minecraft:show_dialog",
        "dialog": {
          "type": "minecraft:multi_action",
          "title": "🐼 Panda Oluşturucu",
          "inputs": [
            {
              "type": "minecraft:text",
              "key": "Name",
              "label": "Panda Adı (Örnek Çılgın Panda)",
              "initial": "Çılgın Panda",
              "max_length": 100
            },
            {
              "type": "minecraft:single_option",
              "key": "MG",
              "label": "Ana Gen (MainGene)",
              "options": [
                {
                  "id": "normal",
                  "display": "Normal"
                },
                {
                  "id": "lazy",
                  "display": "Tembel"
                },
                {
                  "id": "worried",
                  "display": "Endişeli"
                },
                {
                  "id": "playful",
                  "display": "Oyunbaz"
                },
                {
                  "id": "aggressive",
                  "display": "Agresif"
                },
                {
                  "id": "weak",
                  "display": "Zayıf"
                },
                {
                  "id": "brown",
                  "display": "Kahverengi"
                }
              ]
            },
            {
              "type": "minecraft:single_option",
              "key": "HG",
              "label": "Gizli Gen (HiddenGene)",
              "options": [
                {
                  "id": "normal",
                  "display": "Normal"
                },
                {
                  "id": "lazy",
                  "display": "Tembel"
                },
                {
                  "id": "worried",
                  "display": "Endişeli"
                },
                {
                  "id": "playful",
                  "display": "Oyunbaz"
                },
                {
                  "id": "aggressive",
                  "display": "Agresif"
                },
                {
                  "id": "weak",
                  "display": "Zayıf"
                },
                {
                  "id": "brown",
                  "display": "Kahverengi"
                }
              ]
            }
          ],
          "can_close_with_escape": true,
          "pause": false,
          "actions": [
            {
              "label": "🐾 Çağır",
              "action": {
                "type": "minecraft:dynamic/run_command",
                "template": "/summon minecraft:panda ~ ~ ~ {CustomName:{\"text\":\"$(Name)\",\"color\":\"#ffaa00\",\"bold\":true},MainGene:\"$(MG)\",HiddenGene:\"$(HG)\"}"
              }
            }
          ]
        }
      }
    },
    {
      "label": "🎨 GUI Aç (alan_adi:dosya)",
      "action": {
        "type": "minecraft:show_dialog",
        "dialog": {
          "type": "minecraft:multi_action",
          "title": "🎨 GUI Aç",
          "inputs": [
            {
              "type": "minecraft:text",
              "key": "dia",
              "label": "Dialog File",
              "initial": ":",
              "max_length": 10000000
            },
            {
              "type": "minecraft:text",
              "key": "p",
              "label": "Hedef Oyuncu",
              "initial": "@s",
              "max_length": 10000000
            }
          ],
          "can_close_with_escape": true,
          "pause": false,
          "actions": [
            {
              "label": "✅ Aç",
              "action": {
                "type": "minecraft:dynamic/run_command",
                "template": "/function actions:open_gui_with_namespace_path {player:\"$(p)\",dialog:\"$(dia)\"}"
              }
            }
          ]
        }
      }
    },
    {
      "label": "⏩ Diğer...",
      "action": {
        "type": "minecraft:show_dialog",
        "dialog": {
          "type": "minecraft:multi_action",
          "title": "⚙️ GULCE - Admin Power Kontrol Paneli | Diğer Araçlar...",
          "exit_action": {
            "label": "❌ Kapat",
            "action": {
              "type": "minecraft:suggest_command",
              "command": "/say Panel kapatılıyor..."
            }
          },
          "actions": [
            {
              "label": "💡 Hızlı Komutlar",
              "action": {
                "type": "minecraft:show_dialog",
                "dialog": {
                  "type": "minecraft:multi_action",
                  "title": "💡 Hızlı Komutlar",
                  "inputs": [
                    {
                      "type": "minecraft:text",
                      "key": "cmd",
                      "label": "💻 Komut",
                      "max_length": 100000
                    }
                  ],
                  "actions": [
                    {
                      "label": "🚀 Yürüt",
                      "action": {
                        "type": "minecraft:dynamic/run_command",
                        "template": "$(cmd)"
                      }
                    }
                  ]
                }
              }
            },
            {
              "label": "🎵 Müzik Çal",
              "action": {
                "type": "minecraft:show_dialog",
                "dialog": {
                  "type": "minecraft:multi_action",
                  "title": "🎵 Müzik Çalar",
                  "inputs": [
                    {
                      "type": "minecraft:text",
                      "key": "track",
                      "label": "🎶 Müzik ID",
                      "max_length": 100000
                    },
                    {
                      "type": "minecraft:text",
                      "key": "player",
                      "label": "🎯 Oyuncu",
                      "initial": "@s",
                      "max_length": 1000
                    }
                  ],
                  "actions": [
                    {
                      "label": "▶️ Çal",
                      "action": {
                        "type": "minecraft:dynamic/run_command",
                        "template": "/playsound $(track) master $(player)"
                      }
                    }
                  ]
                }
              }
            },
            {
              "label": "🌳 Bitki / Ağaç Oluştur",
              "action": {
                "type": "minecraft:show_dialog",
                "dialog": {
                  "type": "minecraft:multi_action",
                  "title": "🌳 Bitki / Ağaç Oluştur",
                  "inputs": [
                    {
                      "type": "minecraft:text",
                      "key": "block",
                      "label": "🪴 Blok ID",
                      "max_length": 100000
                    },
                    {
                      "type": "minecraft:text",
                      "key": "pos",
                      "label": "📍 Konum (~ ~ ~)",
                      "initial": "~ ~ ~",
                      "max_length": 1000
                    }
                  ],
                  "actions": [
                    {
                      "label": "🌱 Oluştur",
                      "action": {
                        "type": "minecraft:dynamic/run_command",
                        "template": "/setblock $(pos) $(block)"
                      }
                    }
                  ]
                }
              }
            },
            {
              "label": "🔥 Hava Durumu Değiştir",
              "action": {
                "type": "minecraft:show_dialog",
                "dialog": {
                  "type": "minecraft:multi_action",
                  "title": "🔥 Hava Durumu Değiştir",
                  "inputs": [
                    {
                      "type": "minecraft:single_option",
                      "key": "weather",
                      "label": "☁️ Hava Türü",
                      "options": [
                        {
                          "id": "clear",
                          "display": "Güneşli"
                        },
                        {
                          "id": "rain",
                          "display": "Yağmur"
                        },
                        {
                          "id": "thunder",
                          "display": "Fırtına"
                        }
                      ]
                    }
                  ],
                  "actions": [
                    {
                      "label": "⚡ Uygula",
                      "action": {
                        "type": "minecraft:dynamic/run_command",
                        "template": "/weather $(weather)"
                      }
                    }
                  ]
                }
              }
            },
            {
              "label": "💣 Patlama Oluştur",
              "action": {
                "type": "minecraft:show_dialog",
                "dialog": {
                  "type": "minecraft:multi_action",
                  "title": "💣 Patlama Oluştur",
                  "inputs": [
                    {
                      "type": "minecraft:text",
                      "key": "pos",
                      "label": "📍 Konum (~ ~ ~)",
                      "initial": "~ ~ ~",
                      "max_length": 1000
                    },
                    {
                      "type": "minecraft:text",
                      "key": "power",
                      "label": "💥 Güç",
                      "initial": "4",
                      "max_length": 10
                    }
                  ],
                  "actions": [
                    {
                      "label": "💥 Patlat",
                      "action": {
                        "type": "minecraft:dynamic/run_command",
                        "template": "/summon minecraft:fireball $(pos) {ExplosionPower:$(power)}"
                      }
                    }
                  ]
                }
              }
            },
            {
              "label": "Yeniden Yükle",
              "action": {
                "type": "minecraft:show_dialog",
                "dialog": {
                  "type": "minecraft:multi_action",
                  "title": "Onay",
                  "can_close_with_escape": true,
                  "pause": false,
                  "actions": [
                    {
                      "label": "Evet",
                      "action": {
                        "type": "minecraft:run_command",
                        "command": "/reload"
                      }
                    },
                    {
                      "label": "Panoya Kopyala",
                      "action": {
                        "type": "minecraft:copy_to_clipboard",
                        "value": "/reload"
                      }
                    },
                    {
                      "label": "Hayır",
                      "action": {
                        "type": "minecraft:suggest_command",
                        "command": " "
                      }
                    }
                  ]
                }
              }
            }
          ]
        }
      }
    }
  ]
}
```

**Açma:**
```mcfunction
dialog show @s custom:admin_menu
```

### Gelişmiş Dialog - Input

```json
// data/mypack/dialog/input_example.json
{
  "dialog": {
    "title": "Oyuncu Adı Gir",
    "body": "Kick etmek istediğiniz oyuncunun adını yazın:",
    "input": {
      "type": "text",
      "placeholder": "Oyuncu adı...",
      "on_submit": {
        "type": "run_function",
        "function": "mypack:kick_player",
        "with": {
          "player": "$input"
        }
      }
    }
  }
}
```

**Handler:**
```mcfunction
# mypack:kick_player.mcfunction
$kick $(player)
```

### Dinamik Dialog (Runtime)

```mcfunction
# Dialog verisini storage'da oluştur
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{"text":"⚡ GULCE PANEL","color":"gold","bold":true},body:{type:"minecraft:plain_message",contents:"\n§7Sistem ve izin yönetimi için bir kategori seçin:\n "},can_close_with_escape:true,pause:false,columns:2,actions:[]}

### Butonlar
---mcfunction
# --- [ SATIR 1 ] ---
data modify storage mc:dialog ui.actions append value {label:"§6📋 İzin Listesi",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 2"}}

data modify storage mc:dialog ui.actions append value {label:"§b⚙ Ayarlar",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 6"}}

# --- [ SATIR 2 ] ---
data modify storage mc:dialog ui.actions append value {label:"§a✚ Yeni Kayıt",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"➕ Yeni İzin Tanımla",inputs:[{type:"minecraft:text",key:"id",label:"Sistem ID"},{type:"minecraft:text",key:"player",label:"Oyuncu"},{type:"minecraft:text",key:"permission",label:"Yetki Düğümü"},{type:"minecraft:text",key:"level",label:"Seviye",initial:"1"}],actions:[{label:"✅ Kaydet",action:{type:"minecraft:dynamic/run_command",template:"/function custom_admin:add/permission {id:\"$(id)\",player:\"$(player)\",permission:\"$(permission)\",level:$(level)}"}}]}}}

data modify storage mc:dialog ui.actions append value {label:"§e✎ Düzenle",action:{type:"minecraft:show_dialog",dialog:{type:"minecraft:multi_action",title:"✍️ Veri Güncelleme",inputs:[{type:"minecraft:text",key:"id",label:"Düzenlenecek ID",label_visible:1b}],actions:[{label:"İlerle",action:{type:"minecraft:dynamic/run_command",template:"/function glc_menu:handler/builder/edit_single {id:\"$(id)\"}"}}]}}}

# --- [ SATIR 3 ] ---
data modify storage mc:dialog ui.actions append value {label:"§c⚠ Toplu Eylem",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 3"}}

data modify storage mc:dialog ui.actions append value {label:"§7◀ Geri Dön",action:{type:"minecraft:run_command",command:"/trigger gulce_trigger set 1"}}
---

# Aç
/function glc_menu:handler/dialog/open
```

### GulceOS Menu Sistemi (glc_menu)

GulceOS'un kendi menu builder'ı var.

```mcfunction
# Menu oluştur
function glc_menu:handler/builder/main

# Ayarları göster
execute as x run trigger gulce_menu set 6
```

---

---

## 🔒 Security API

### Anti-Xray API

#### Manuel Scan

```mcfunction
# Belirli bir oyuncuyu tara
execute as <player> run function gss_security:anti_xray/scan

# Sonuç @s'in gss.xray skorunda
```

#### Skor Kontrolü

```mcfunction
# Şüpheli mi?
execute if score @s gss.xray matches 75.. run say Şüpheli!

# Skor al
execute store result score #temp temp run scoreboard players get @s gss.xray
```

#### Ayar Değiştirme

```mcfunction
# Eşik değiştir
data modify storage gss:config settings.anti_xray.suspicious_threshold set value 80

# Tarama yarıçapı
data modify storage gss:config settings.anti_xray.scan_radius set value 30.0d

# Otomatik dondurma
data modify storage gss:config settings.anti_xray.auto_freeze set value 1b
```

### Admin Vision API

#### Toggle

```mcfunction
# Aç/Kapat
function gss_security:admin_vision/toggle

# Manuel kontrol
execute if score @s gss.vision matches 1 run say Açık!
```

#### Raycast Callback

```mcfunction
# Admin Vision aktifken entity tespit edildiğinde
# data/gss_security/tags/function/admin_vision_hit.json
{
  "values": [
    "mypack:on_vision_hit"
  ]
}

# mypack:on_vision_hit.mcfunction
# @s = admin
# Tespit edilen entity yakınlarda

particle minecraft:angry_villager ~ ~ ~ 0 0 0 0 1
```

### Protected Entity

Bazı entity'ler korunabilir:

```mcfunction
# Entity'i koru
tag @e[type=armor_stand,limit=1] add protected

# custom/tags/entity_type/protected.json'da tanımlanmış tipler otomatik korunur
```

---

## 📚 Bookshelf Entegrasyonu

GulceOS, Bookshelf v3.2+ özelliklerini kullanır.

### Raycast Modülü

```mcfunction
# Basit raycast
execute as @a run function #bs.raycast:run {\
  with: {\
    on_hit: "mypack:on_block_hit"\
  }\
}

# mypack:on_block_hit.mcfunction
# Vurulan blok ~ ~ ~'da
setblock ~ ~ ~ air
```

### Log Modülü

```mcfunction
# Info log
function #bs.log:info {\
  namespace: "mypack",\
  path: "mypack:my_function",\
  tag: "general",\
  message: '"Bilgi mesajı"'\
}

# Warning
function #bs.log:warn {\
  namespace: "mypack",\
  path: "mypack:my_function",\
  tag: "security",\
  message: '"Uyarı!"'\
}

# Error
function #bs.log:error {\
  namespace: "mypack",\
  path: "mypack:my_function",\
  tag: "critical",\
  message: '"HATA!"'\
}
```

### Dump Modülü

```mcfunction
# Değişken göster
function #bs.dump:var {var: "storage mypack:data"}

# Çoklu değişken
function #bs.dump:var {\
  var: {\
    config: "storage mypack:config",\
    temp: "storage mypack:temp"\
  }\
}
```

### Math Modülü

```mcfunction
# Rastgele sayı
function #bs.random:number {min: 1, max: 100}
execute store result score #rand temp run data get storage bs:out random.number

# Trigonometri
function #bs.math:sin {angle: 45.0d}
execute store result score #sin temp run data get storage bs:out math.sin 1000
```

---

## 🔌 Addon Geliştirme

### Addon Yapısı

```
mypack/
  ├── pack.mcmeta
  ├── data/
  │   ├── mypack/
  │   │   ├── function/
  │   │   │   ├── init.mcfunction
  │   │   │   ├── tick.mcfunction
  │   │   │   └── ...
  │   │   ├── predicate/
  │   │   │   └── ...
  │   │   ├── dialog/
  │   │   │   └── ...
  │   │   └── tags/
  │   │       └── function/
  │   │           ├── load.json
  │   │           └── tick.json
  │   └── minecraft/
  │       └── tags/
  │           └── function/
  │               ├── load.json
  │               └── tick.json
  └── README.md
```

### pack.mcmeta

```json
{
  "pack": {
    "pack_format": 48,
    "description": "MyPack - GulceOS Addon",
    "supported_formats": [
      81,
      94
    ],
    "min_format": [
      81,
      1
    ],
    "max_format": 94
  }
}
```

### Init Hook

```mcfunction
# data/mypack/function/init.mcfunction

# Scoreboard'lar
scoreboard objectives add mypack.data dummy
scoreboard objectives add mypack.trigger trigger

# Storage init
data modify storage mypack:config settings set value {enabled: 1b}

# Tag'ler
tag @a remove mypack.init

# Log
function #bs.log:info {\
  namespace: "mypack",\
  path: "mypack:init",\
  tag: "init",\
  message: '"MyPack initialized!"'\
}

say MyPack v1.0 loaded!
```

### Tick Hook

```mcfunction
# data/mypack/function/tick.mcfunction

# Yeni oyuncular
execute as @a[tag=!mypack.init] run function mypack:on_join

# Trigger
execute as @a[scores={mypack.trigger=1..}] run function mypack:handle_trigger

# Custom logic
execute as @a run function mypack:player_tick
```

### GulceOS Entegrasyonu

```mcfunction
# GulceOS izin sistemi ile entegre
execute if predicate actions:can_use_panel run function mypack:admin_action

# GulceOS menu'ye buton ekle (config ile)
data modify storage glc_menu:config custom_buttons append value {\
  text: "MyPack",\
  on_click: {type: "run_function", function: "mypack:open_menu"}\
}

# Anti-Xray hook
# data/gss_security/tags/function/on_xray_detect.json'a ekle
```

### Addon Compatibility Check

```mcfunction
# mypack:init.mcfunction içinde

# GulceOS var mı?
execute unless data storage gss:config settings run function mypack:error/no_gulceos

# Bookshelf var mı?
execute unless function #bs.load:status run function mypack:error/no_bookshelf

# Versiyon kontrolü
execute store result score #version temp run data get storage gss:config version
execute if score #version temp matches ..26 run function mypack:error/old_version
```

---

## ✅ Best Practices

### 1. Namespace Kullanımı

```mcfunction
# ❌ KÖTÜ
scoreboard objectives add data dummy
function init

# ✅ İYİ
scoreboard objectives add mypack.data dummy
function mypack:init
```

### 2. Storage Organizasyonu

```mcfunction
# ❌ KÖTÜ - Tek storage'a her şey
data modify storage mypack:data players set value []
data modify storage mypack:data config set value {}
data modify storage mypack:data temp set value {}

# ✅ İYİ - Ayrı storage'lar
data modify storage mypack:players list set value []
data modify storage mypack:config settings set value {}
data modify storage mypack:temp data set value {}
```

### 3. Performans

```mcfunction
# ❌ KÖTÜ - Her tick tüm oyuncular
execute as @a run function mypack:heavy_function

# ✅ İYİ - Schedule ile
schedule function mypack:scheduled_scan 20t replace

# mypack:scheduled_scan içinde:
execute as @a run function mypack:heavy_function
schedule function mypack:scheduled_scan 20t replace
```

### 4. Selector Optimizasyonu

```mcfunction
# ❌ KÖTÜ
execute as @a if score @s mypack.data matches 1 run ...
execute as @a if score @s mypack.data matches 2 run ...

# ✅ İYİ
execute as @a[scores={mypack.data=1}] run ...
execute as @a[scores={mypack.data=2}] run ...
```

### 5. Error Handling

```mcfunction
# ✅ İYİ - Hata kontrolü
execute store success score #success temp run function mypack:risky_action

execute if score #success temp matches 0 run function mypack:error_handler
execute if score #success temp matches 1 run tellraw @s {"text":"Başarılı!","color":"green"}
```

### 6. Magic Number Kullanmayın

```mcfunction
# ❌ KÖTÜ
scoreboard players set #threshold temp 75

# ✅ İYİ
scoreboard players set #xray_threshold const 75
scoreboard players operation #threshold temp = #xray_threshold const
```

### 7. Dokümantasyon

```mcfunction
# ✅ İYİ - Fonksiyon başına yorum
# mypack:check_permission.mcfunction
#
# Kontrol eder: Oyuncunun belirtilen izni var mı?
# Input: @s = kontrol edilecek oyuncu
# Input: storage mypack:temp permission = izin string'i
# Output: score #has_perm temp (0=yok, 1=var)

# Ana logic...
```

---

## 🐛 Debugging

### Debug Mode

```mcfunction
# Debug mod aç
data modify storage mypack:config debug set value 1b

# Fonksiyonlarda kullan
execute if data storage mypack:config {debug: 1b} run say DEBUG: Function called
```

### Bookshelf Log ile Debug

```mcfunction
# Debug log'u
function #bs.log:debug {\
  namespace: "mypack",\
  path: "mypack:my_function",\
  tag: "debug",\
  message: '"Variable value: " + (storage mypack:temp value)'\
}

# Tag ile kontrol
tag @s add mypack.log._.debug
```

### Dump ile Debugging

```mcfunction
# Storage'ı görüntüle
function #bs.dump:var {var: "storage mypack:config"}

# Scoreboard'ı görüntüle
function #bs.dump:score {objective: "mypack.data"}
```

### Common Errors

#### "Unknown function"
```mcfunction
# Sebep: Yol yanlış veya datapack yüklü değil
# Çözüm:
/datapack list
/reload
```

#### "No entity was found"
```mcfunction
# Sebep: Selector yanlış
# Çözüm:
execute as @a[tag=mypack.target] run ...
# yerine
execute as @a if entity @s[tag=mypack.target] run ...
```

#### "Data modification failed"
```mcfunction
# Sebep: NBT path yanlış
# Çözüm: Önce mevcut veriyi kontrol et
data get storage mypack:config
# Sonra doğru path'i kullan
```

### Performance Profiling

```mcfunction
# Başlangıç zamanı
execute store result score #start_time temp run time query gametime

# İşlem
function mypack:heavy_function

# Bitiş zamanı
execute store result score #end_time temp run time query gametime

# Fark
scoreboard players operation #duration temp = #end_time temp
scoreboard players operation #duration temp -= #start_time temp

# Sonuç
tellraw @a [{"text":"Duration: "},{"score":{"name":"#duration","objective":"temp"}},{"text":" ticks"}]
```

---

## 📖 Örnek Addon Projesi

### Basit Economy Addon

```mcfunction
# data/economy/function/init.mcfunction

# Scoreboard
scoreboard objectives add economy.money dummy "Para"
scoreboard objectives add economy.trigger trigger

# Storage
data modify storage economy:config settings set value {\
  starting_money: 100,\
  max_money: 999999\
}

# Her oyuncuya başlangıç parası
execute as @a[tag=!economy.init] run function economy:give_starting_money

say Economy System loaded!

# ---

# data/economy/function/give_starting_money.mcfunction

tag @s add economy.init

execute store result score @s economy.money run data get storage economy:config settings.starting_money

tellraw @s [\
  {"text":"[Economy] ","color":"gold"},\
  {"text":"Hoş geldiniz! Başlangıç paranız: "},\
  {"score":{"name":"@s","objective":"economy.money"}},\
  {"text":" coin"}\
]

# ---

# data/economy/function/tick.mcfunction

# Trigger
execute as @a[scores={economy.trigger=1}] run function economy:show_balance
scoreboard players reset @a[scores={economy.trigger=1..}] economy.trigger

# Enable trigger
scoreboard players enable @a economy.trigger

# ---

# data/economy/function/show_balance.mcfunction

tellraw @s [\
  {"text":"[Economy] ","color":"gold"},\
  {"text":"Bakiyeniz: "},\
  {"score":{"name":"@s","objective":"economy.money"},"color":"green"},\
  {"text":" coin"}\
]

# ---

# GulceOS ile entegrasyon
# data/economy/function/integrate_gulceos.mcfunction

# Admin izni ekle
execute if predicate actions:can_use_panel run tellraw @s [\
  {"text":"[Economy] ","color":"gold"},\
  {"text":"Admin olarak tüm economy komutlarına erişebilirsiniz."}\
]

# Menu'ye buton ekle
data modify storage glc_menu:temp custom_button set value {\
  text: "💰 Economy",\
  on_click: {\
    type: "run_function",\
    function: "economy:open_menu"\
  }\
}
```

---

## 📞 Destek ve Katkı

### API Sorular için

- GitHub Issues: [proje linki]
- Discord: [sunucu linki]
- Email: [destek maili]

### API Güncelleme Takibi

```mcfunction
# API versiyonunu kontrol et
data get storage gss:config api_version

# Değişiklik log'u
function #bs.log:history
```

### Katkıda Bulunma

1. Fork edin
2. Feature branch oluşturun (`git checkout -b feature/YeniOzellik`)
3. Değişikliklerinizi commit edin
4. Push edin (`git push origin feature/YeniOzellik`)
5. Pull Request açın

---

## 📄 Changelog

### API v2 (GulceOS v2.7)
- ✨ Bookshelf v3.2 tam entegrasyonu
- ✨ Dialog API eklendi
- ✨ Security API eklendi
- 🔧 Storage yapısı optimize edildi
- 📚 Detaylı dokümantasyon

### API v1 (GulceOS v2.4)
- İlk API sürümü
- Temel scoreboard ve function API
- Basit permission sistemi

---

**🔧 Happy Coding! API ile ilgili sorularınız için yukarıdaki kanallardan ulaşabilirsiniz.**

---

*Son güncelleme: Şubat 2026*
