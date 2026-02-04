# ═══════════════════════════════════════════════════════════════
# GSS Anti-Xray System - Initialization
# ═══════════════════════════════════════════════════════════════

# X-Ray skorlarını sıfırla
scoreboard players set @a gss.xray 0

# Storage
data modify storage gss:anti_xray data set value { \
  scan_active: 0b, \
  last_scan: 0, \
  detected_players: [] \
}

# Log
function #bs.log:info { \
  namespace: "gss_security", \
  path: "gss_security:anti_xray/init", \
  tag: "anti_xray", \
  message: '"Anti-Xray sistemi aktif! 🔍"' \
}
