# ═══════════════════════════════════════════════════════════════
# GSS Anti-Xray - Reset Scores
# Her 5 dakikada skorları azalt
# ═══════════════════════════════════════════════════════════════

scoreboard players remove @a[scores={gss.xray=1..}] gss.xray 10
scoreboard players set @a[scores={gss.xray=..0}] gss.xray 0

function #bs.log:debug { \
  namespace: "gss_security", \
  path: "gss_security:anti_xray/reset_scores", \
  tag: "anti_xray", \
  message: '"X-Ray skorlari sifirlandi"' \
}
