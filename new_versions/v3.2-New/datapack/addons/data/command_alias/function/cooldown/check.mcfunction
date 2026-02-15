# ============================================
# Check if player has active cooldown
# ============================================
# Returns: success if NO cooldown (can use)
#          fail if HAS cooldown (cannot use)

# Check cooldown score
execute if score @s ca.cooldown matches 1.. run return run function command_alias:cooldown/display

# No cooldown - can proceed
return 1
