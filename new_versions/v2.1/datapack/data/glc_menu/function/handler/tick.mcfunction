# ═══════════════════════════════════════════════════
# GLC Menu - Tick Handler - DÜZELTİLDİ
# ═══════════════════════════════════════════════════

# Trigger kontrolü
execute as @a[scores={gulce_menu=1..}] run function glc_menu:handler/trigger

# Loading skorları azalt
scoreboard players remove @a[scores={gulce_load.dialog=1..}] gulce_load.dialog 1

# Sadece 0'a düştüğünde BİR KEZ göster
execute as @a[scores={gulce_load.dialog=0},tag=glc.show_pending] run function glc_menu:handler/dialog/open

# Tag temizliği
tag @a[tag=closed.glc] remove closed.glc
tag @a[tag=glc.close_dialog] remove glc.close_dialog

# Admin NPC
execute as @e[type=interaction,tag=_glcMenu] store success entity @s attack.player[] int 0 on attacker run function glc_menu:handler/builder/main
execute as @e[type=interaction,tag=_glcMenu] store success entity @s interaction.player[] int 0 on target run function glc_menu:handler/builder/permissions

# Trigger Etkinleştir
scoreboard players enable @a[tag=gulce_admin] gulce_trigger
scoreboard players enable @a[tag=gulce_admin] gulce_menu
