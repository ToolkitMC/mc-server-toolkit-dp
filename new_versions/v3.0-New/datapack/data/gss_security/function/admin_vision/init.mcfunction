# ═══════════════════════════════════════════════════════════════
# GSS Admin Vision - Initialization
# ═══════════════════════════════════════════════════════════════

# Admin vision skorları
scoreboard players set @a gss.vision 0

function #bs.log:info { \
  namespace: "gss_security", \
  path: "gss_security:admin_vision/init", \
  tag: "admin_vision", \
  message: '"Admin Vision sistemi aktif! 👁️"' \
}
