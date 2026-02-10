# ═══════════════════════════════════════════════════════════════
# GSS Admin Vision - Raycast
# Duvarların arkasını görmek için piercing raycast
# ═══════════════════════════════════════════════════════════════

# Config'den particle type'ı al
data modify storage gss:temp particle_type set from storage gss:config settings.admin_vision.particle_type

# Piercing raycast - duvarların içinden geçer
function #bs.raycast:run { \
  with: { \
    max_distance: 100.0, \
    blocks: true, \
    entities: true, \
    piercing: { blocks: 20, entities: 5 }, \
    on_hit_point: "particle minecraft:end_rod ~ ~ ~ 0 0 0 0 1 force @s", \
    on_targeted_entity: "function gss_security:admin_vision/show_entity" \
  } \
}
