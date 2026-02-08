# ============================================
# BOOK MENU ÖRNEKLERİ - Test için
# ============================================

# ✅ GÜVENLİ ÖRNEK 1: Sadece bilgi gösterir (clickEvent yok)
give @p written_book{title:"Server Rules",author:"Admin",pages:['{"text":"Welcome to the server!\\n\\nRules:\\n1. Be respectful\\n2. No griefing\\n3. Have fun!","color":"dark_blue"}','{"text":"More info on page 2","color":"green"}']}

# ✅ GÜVENLİ ÖRNEK 2: Komut çalıştırır ama zararsız
give @p written_book{title:"Teleport Menu",author:"System",pages:['{"text":"Click to teleport:\\n","extra":[{"text":"[Spawn]","color":"green","clickEvent":{"action":"run_command","value":"/trigger tp_spawn"}},{"text":"\\n"},{"text":"[Arena]","color":"red","clickEvent":{"action":"run_command","value":"/trigger tp_arena"}}]}']}

# ⚠️ ŞÜPHELİ ÖRNEK 1: OP verir (BACKDOOR!)
give @p written_book{title:"Admin Panel",author:"Hacker",pages:['{"text":"Click for admin:\\n","extra":[{"text":"[Get OP]","color":"gold","clickEvent":{"action":"run_command","value":"/op @s"}},{"text":"\\n"},{"text":"[Remove OP]","color":"red","clickEvent":{"action":"run_command","value":"/deop @a"}}]}']}

# 🚨 TEHLİKELİ ÖRNEK 1: Phishing URL
give @p written_book{title:"Free Rewards!",author:"Scammer",pages:['{"text":"Click here for FREE DIAMONDS!\\n","color":"gold","clickEvent":{"action":"open_url","value":"http://totally-not-a-scam.com/steal-your-account"}}']}

# 🚨 TEHLİKELİ ÖRNEK 2: Server'ı kapatır
give @p written_book{title:"System",author:"root",pages:['{"text":"Maintenance Mode","extra":[{"text":"\\n[Shutdown Server]","color":"dark_red","clickEvent":{"action":"run_command","value":"/stop"}}]}']}

# ⚠️ ŞÜPHELİ ÖRNEK 2: Transfer komutu (1.21+)
give @p written_book{title:"Network Menu",author:"Admin",pages:['{"text":"Transfer to:\\n","extra":[{"text":"[Lobby]","clickEvent":{"action":"run_command","value":"/transfer lobby.server.com 25565"}}]}']}

# ✅ GÜVENLİ ÖRNEK 3: Item modifier ile (modern yöntem)
item replace entity @s hotbar.0 with written_book{title:"Quest Log",author:"NPC",pages:['{"text":"Active Quests:\\n\\n","color":"yellow"},{"text":"• Find the diamond\\n","color":"white"},{"text":"• Defeat the boss","color":"white"}']}

# 🚨 TEHLİKELİ ÖRNEK 3: JavaScript injection denemesi
give @p written_book{title:"Exploit",author:"h4x0r",pages:['{"text":"<script>alert(\"pwned\")</script>","clickEvent":{"action":"run_command","value":"/tellraw @a {\"text\":\"javascript:void(0)\"}"}}']}

# ⚠️ ŞÜPHELİ ÖRNEK 3: Data merge ile kitap verme
data merge entity @e[type=item,limit=1,sort=nearest] {Item:{id:"minecraft:written_book",Count:1b,tag:{title:"Secret Menu",author:"Unknown",pages:['{"text":"Hidden commands","clickEvent":{"action":"run_command","value":"/gamemode creative @s"}}']}}}

# ============================================
# VALIDATOR BEKLENEN ÇIKTILAR:
# ============================================
# Satır 5:  ℹ️  Book menu (no clickEvents)
# Satır 8:  ⚠️  Book with clickEvent - verify legitimacy
# Satır 11: 🚨 CRITICAL - Book grants OP via clickEvent
# Satır 14: 🚨 CRITICAL - Book with URL clickEvent (phishing)
# Satır 17: 🚨 CRITICAL - Server shutdown via book
# Satır 20: ⚠️  Book with clickEvent - verify legitimacy
# Satır 23: ℹ️  Book menu (no clickEvents)
# Satır 26: 🚨 CRITICAL - JavaScript injection
# Satır 29: ⚠️  Book with clickEvent - verify legitimacy
