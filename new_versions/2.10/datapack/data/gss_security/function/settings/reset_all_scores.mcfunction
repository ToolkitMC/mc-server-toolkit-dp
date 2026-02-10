# ═══════════════════════════════════════════════════════════════
# GSS Settings - Reset All Scores
# ═══════════════════════════════════════════════════════════════

scoreboard players set @a gss.xray 0

tellraw @a [{"text":"[GSS] ","color":"aqua"},{"text":"TUM X-RAY SKORLARI SIFIRLANDI!","color":"yellow","bold":true}]

function #bs.log:warn { \
  namespace: "gss_security", \
  path: "gss_security:settings/reset_all_scores", \
  tag: "admin", \
  message: [{text:"Admin tüm X-Ray skorlarini sıfırladı: ",color:"yellow"},{selector:"@s",color:"aqua"}] \
}

playsound minecraft:block.anvil.use master @a ~ ~ ~ 1 1
function gss_security:gui/settings
