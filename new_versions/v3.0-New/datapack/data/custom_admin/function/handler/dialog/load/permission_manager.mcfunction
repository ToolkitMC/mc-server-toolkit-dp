# ═══════════════════════════════════════════════════
# Load Permission Manager
# ═══════════════════════════════════════════════════

execute as @p[tag=gulce_admin,tag=!closed.glc,limit=1,sort=arbitrary] at @s run trigger gulce_menu

tellraw @a[tag=gulce_admin] ["",{"text":"[GULCE] ","color":"gold","bold":true},{"text":"İzin yönetimi yüklendi.","color":"gray"}]
