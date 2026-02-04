# ═══════════════════════════════════════════════════
# OWNER PERMISSION INIT
# Owner izinlerini başlat ve scoreboard'ları oluştur
# ═══════════════════════════════════════════════════

# Tag'leri ekle
$tag $(Player) add op
$tag $(Player) add Owner

# Team ayarları
team modify Owner prefix {"text":"[Owner] ","color":"gold","bold":true}
team modify Owner color gold
$team join Owner $(Player)

# ───────────────────────────────────────────────────
# SCOREBOARD OBJECTİVES (Trigger)
# ───────────────────────────────────────────────────

# Gamemode
scoreboard objectives add ap_survival trigger
scoreboard objectives add ap_adventure trigger
scoreboard objectives add ap_spectator trigger
scoreboard objectives add ap_creative_all trigger
scoreboard objectives add ap_survival_all trigger

# XP & Levels
scoreboard objectives add ap_add_xp trigger
scoreboard objectives add ap_max_xp trigger

# Entity Management
scoreboard objectives add ap_kill_all_mobs trigger
scoreboard objectives add ap_kill_items trigger

# Dialogs
scoreboard objectives add ap_run trigger

# Permissions
scoreboard objectives add ap_op_all trigger
scoreboard objectives add ap_deop_all trigger

# Effects
scoreboard objectives add ap_heal_all trigger
scoreboard objectives add ap_clear_all trigger
scoreboard objectives add ap_god_mode trigger
scoreboard objectives add ap_super_speed trigger
scoreboard objectives add ap_super_jump trigger

# Fun & Destruction
scoreboard objectives add ap_explode trigger
scoreboard objectives add ap_nuke trigger

# Teleportation
scoreboard objectives add ap_tp_all trigger

# World Management
scoreboard objectives add ap_set_spawn trigger
scoreboard objectives add ap_clear_chunks trigger
scoreboard objectives add ap_reset_world trigger

# Debug
scoreboard objectives add ap_debug trigger

# ───────────────────────────────────────────────────
# ENABLE TRIGGERS
# ───────────────────────────────────────────────────
$scoreboard players enable $(Player) ap_survival
$scoreboard players enable $(Player) ap_adventure
$scoreboard players enable $(Player) ap_spectator
$scoreboard players enable $(Player) ap_creative_all
$scoreboard players enable $(Player) ap_survival_all
$scoreboard players enable $(Player) ap_add_xp
$scoreboard players enable $(Player) ap_max_xp
$scoreboard players enable $(Player) ap_kill_all_mobs
$scoreboard players enable $(Player) ap_kill_items
$scoreboard players enable $(Player) ap_run
$scoreboard players enable $(Player) ap_op_all
$scoreboard players enable $(Player) ap_deop_all
$scoreboard players enable $(Player) ap_heal_all
$scoreboard players enable $(Player) ap_clear_all
$scoreboard players enable $(Player) ap_god_mode
$scoreboard players enable $(Player) ap_super_speed
$scoreboard players enable $(Player) ap_super_jump
$scoreboard players enable $(Player) ap_explode
$scoreboard players enable $(Player) ap_nuke
$scoreboard players enable $(Player) ap_tp_all
$scoreboard players enable $(Player) ap_set_spawn
$scoreboard players enable $(Player) ap_clear_chunks
$scoreboard players enable $(Player) ap_reset_world
$scoreboard players enable $(Player) ap_debug

# ───────────────────────────────────────────────────
# CONFIRMATION MESSAGE
# ───────────────────────────────────────────────────
$tellraw $(Player) ["",{"text":"═══════════════════════════════","color":"gold","bold":true}]
$tellraw $(Player) ["",{"text":"⚡ OWNER İZİNLERİ AKTİF! ⚡","color":"gold","bold":true}]
$tellraw $(Player) ["",{"text":"═══════════════════════════════","color":"gold","bold":true}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"Gamemode Kontrolü","color":"aqua"}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"Dünya Yönetimi","color":"aqua"}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"İzin Kontrolü","color":"aqua"}]
$tellraw $(Player) ["",{"text":"• ","color":"gray"},{"text":"Debug Araçları","color":"aqua"}]
$tellraw $(Player) ["",{"text":"═══════════════════════════════","color":"gold","bold":true}]
