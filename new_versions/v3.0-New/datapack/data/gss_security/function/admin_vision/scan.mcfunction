# ═══════════════════════════════════════════════════════════════
# GSS Admin Vision - Scan
# Admin'lerin baktığı yeri particle ile göster
# ═══════════════════════════════════════════════════════════════

# Sadece admin vision açık olan admin'ler için
execute as @a[tag=gulceos_permissions_admin,scores={gss.vision=1..}] at @s anchored eyes positioned ^ ^ ^ run function gss_security:admin_vision/raycast
