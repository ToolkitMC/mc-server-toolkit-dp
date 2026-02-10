# ============================================
# Command Alias System - Initialization
# ============================================
# Komut kısayolları ve makro sistemi
# Cooldown ve permission kontrolü ile

# Scoreboards
scoreboard objectives add ca.trigger trigger "Command Alias Trigger"
scoreboard objectives add ca.cooldown dummy "Alias Cooldown"
scoreboard objectives add ca.temp dummy "Alias Temp"
scoreboard objectives add ca.use minecraft.used:minecraft.carrot_on_a_stick

# Storage - Config
data modify storage ca:config settings set value {enabled:1b,default_cooldown:30,max_cooldown:300,debug:0b}

# Storage - Alias Definitions
data modify storage ca:aliases list set value []

# Alias: heal_feed
data modify storage ca:aliases list append value {id:"heal_feed",name:"Heal & Feed",commands:["effect give @s minecraft:instant_health 1 10 true","effect give @s minecraft:saturation 1 10 true"],cooldown:30,permission:"admin"}

# Alias: clear_announce
data modify storage ca:aliases list append value {id:"clear_announce",name:"Clear & Announce",commands:["clear @s","tellraw @a {\"text\":\"[Server] \",\"color\":\"gold\",\"extra\":[{\"selector\":\"@s\"},{\"text\":\" envanteri temizlendi!\",\"color\":\"yellow\"}]}"],cooldown:60,permission:"mod"}

# Alias: tp_notify
data modify storage ca:aliases list append value {id:"tp_notify",name:"TP with Notify",commands:["tp @s ~ ~1 ~","title @s actionbar {\"text\":\"✈ Işınlandınız!\",\"color\":\"aqua\"}","playsound minecraft:entity.enderman.teleport master @s"],cooldown:45,permission:"admin"}

# Alias: gmc_effects
data modify storage ca:aliases list append value {id:"gmc_effects",name:"Creative + Effects",commands:["gamemode creative @s","effect give @s minecraft:night_vision 999999 0 true","effect give @s minecraft:speed 999999 1 true","title @s actionbar {\"text\":\"⚡ Creative Mode + Efektler aktif!\",\"color\":\"gold\"}"],cooldown:10,permission:"admin"}

# Alias: event_prep
data modify storage ca:aliases list append value {id:"event_prep",name:"Event Preparation",commands:["weather clear","time set day","tp @a 0 100 0","title @a title {\"text\":\"EVENT BAŞLIYOR!\",\"color\":\"gold\",\"bold\":true}","playsound minecraft:entity.ender_dragon.growl master @a"],cooldown:300,permission:"owner"}

# Alias: quick_freeze
data modify storage ca:aliases list append value {id:"quick_freeze",name:"Quick Freeze Player",commands:["function custom:freeze_on","tellraw @a[tag=admin] {\"text\":\"⚠ Oyuncu donduruldu: \",\"color\":\"red\",\"extra\":[{\"selector\":\"@s\"}]}"],cooldown:15,permission:"mod"}

# Alias: mod_toolkit
data modify storage ca:aliases list append value {id:"mod_toolkit",name:"Moderator Toolkit",commands:["clear @s","give @s minecraft:stick[custom_name='{\"text\":\"🔨 Mod Stick\",\"color\":\"red\",\"bold\":true}']","give @s minecraft:compass[custom_name='{\"text\":\"🧭 Player Tracker\",\"color\":\"aqua\"}']","effect give @s minecraft:night_vision 999999 0 true","title @s actionbar {\"text\":\"🛡 Moderasyon araçları verildi!\",\"color\":\"green\"}"],cooldown:120,permission:"mod"}

# Storage - Cooldowns
data modify storage ca:cooldowns active set value []

# Enable triggers for all players
scoreboard players enable @a ca.trigger

# Success message
tellraw @a[tag=admin] {"text":"[Command Alias] Sistem başlatıldı!","color":"green"}
