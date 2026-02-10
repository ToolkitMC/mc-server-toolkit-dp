# ═══════════════════════════════════════════════════════════════
# GSS Anti-Xray - Scan Function
# Oyuncuların baktığı bloklara raycast ile tarama yapar
# ═══════════════════════════════════════════════════════════════

# Her oyuncu için gözlerinden raycast at
execute as @a[gamemode=!spectator] at @s anchored eyes positioned ^ ^ ^ run function gss_security:anti_xray/player_scan
