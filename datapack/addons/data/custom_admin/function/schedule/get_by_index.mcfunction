# ═══════════════════════════════════════════════════
# Index'e Göre Zamanlama Al (MACRO)
# ═══════════════════════════════════════════════════

$data modify storage mc:_ temp.current_schedule set from storage mc:handler data.scheduled[$(current_index)]