# ============================================
# Execute Command Chain via Macro
# ============================================
# Usage: function command_alias:execute/chain {commands:["cmd1","cmd2"]}

# This uses data storage to loop through commands
# Individual commands are executed via macro

# Get first command from storage and execute
data modify storage ca:temp current_cmd set from storage ca:temp commands[0]
function command_alias:execute/macro with storage ca:temp current_cmd

# Remove executed command
data remove storage ca:temp commands[0]

# Continue if more commands exist
execute if data storage ca:temp commands[0] run function command_alias:execute/chain
