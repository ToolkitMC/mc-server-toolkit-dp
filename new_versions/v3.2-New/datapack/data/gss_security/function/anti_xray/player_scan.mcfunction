# ═══════════════════════════════════════════════════════════════
# GSS Anti-Xray - Player Scan
# Tek bir oyuncu için raycast taraması
# ═══════════════════════════════════════════════════════════════

# Config'den max mesafeyi al
execute store result score #scan_distance gss.stats run data get storage gss:config settings.anti_xray.scan_radius

# Raycast at - değerli cevherlere bakan oyuncuları tespit et
function #bs.raycast:run { \
  with: { \
    max_distance: 50.0, \
    blocks: true, \
    ignored_blocks: "#bs.hitbox:intangible", \
    on_targeted_block: "function gss_security:anti_xray/check_ore" \
  } \
}
