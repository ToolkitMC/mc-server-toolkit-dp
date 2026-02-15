# ═══════════════════════════════════════════════════
# GULCE ADMINPOWER ADDONS - Loop (SCHEDULED)
# Runs every 5 ticks instead of every tick
# ═══════════════════════════════════════════════════

# Flag kontrolü: Sistem aktif mi?
execute unless score #main global matches 1 run return 0

# Oyuncu kontrolü: Oyuncu yoksa çalışma
execute unless entity @a run return 0

# Ana işler (orjinal kodlar)
# ───────────────────────────────────────────────────
# TICK SYSTEMS - Player-specific context needed
# ───────────────────────────────────────────────────
execute as @a at @s run function custom:permissions/admin/tick
execute as @a at @s run function custom:permissions/owner/tick
execute as @a at @s run function custom:permissions/mod/tick
execute as @a at @s run function custom:permissions/builder/tick
execute as @a at @s run function gulce_adminpower_addons:help_menu/tick
execute as @a at @s run function gss_security:core/tick

# ───────────────────────────────────────────────────
# TRIGGER ENABLES - Global, no player context needed
# ───────────────────────────────────────────────────
function custom:permissions/enable_admin_triggers
function custom:permissions/enable_owner_triggers
function gulce_adminpower_addons:help_menu/enable/1 {"tag":"Admin"}
function gulce_adminpower_addons:permission_level/tick {"tag":"mod"}

# ───────────────────────────────────────────────────
# SCOREBOARD OPERATIONS - Specific targets only
# ───────────────────────────────────────────────────
scoreboard objectives add permission_level trigger
scoreboard players enable @a[tag=Admin] permission_level

# ───────────────────────────────────────────────────
# DATA STORAGE - Global operations
# ───────────────────────────────────────────────────
data modify storage custom:storage Log set from storage userfunc:log
data modify storage custom:storage Data set from storage userfunc:data

# ───────────────────────────────────────────────────
# SPECIAL HANDLERS - Global systems
# ───────────────────────────────────────────────────
function custom:freeze_handler