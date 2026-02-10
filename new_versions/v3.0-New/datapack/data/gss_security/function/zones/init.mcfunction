# ═══════════════════════════════════════════════════════════════
# GSS Zones - Initialization
# Protected zone sistemi
# ═══════════════════════════════════════════════════════════════

# Zone storage
data modify storage gss:zones data set value { \
  zones: [], \
  active_count: 0 \
}

function #bs.log:info { \
  namespace: "gss_security", \
  path: "gss_security:zones/init", \
  tag: "zones", \
  message: '"Protected Zones sistemi aktif! 🛡️"' \
}
