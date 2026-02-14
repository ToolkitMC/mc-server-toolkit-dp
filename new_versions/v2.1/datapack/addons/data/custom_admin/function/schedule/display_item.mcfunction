# ═══════════════════════════════════════════════════
# Zamanlama Item Gösterici (MACRO)
# ═══════════════════════════════════════════════════

# İkon seç
execute unless score #repeat_check gulce_id matches 1 run data modify storage mc:_ temp.icon set value "⏱️"

# Göster
$tellraw @s ["",{"text":"  ","color":"gray"},{"nbt":"temp.icon","storage":"mc:_","interpret":true},{"text":" #$(schedule_id) ","color":"yellow","bold":true},{"text":"- ","color":"gray"},{"text":"$(action_id)","color":"aqua"},{"text":" (","color":"gray"},{"text":"$(remaining)","color":"green"},{"text":"/","color":"gray"},{"text":"$(delay)","color":"yellow"},{"text":" tick)","color":"gray"}]
