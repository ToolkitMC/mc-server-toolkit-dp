$data merge storage custom:storage {"name":"$(name)","open_gui":0b}
$execute at $(name) if data storage custom:storage {"name":"$(name)","open_gui":0b} run dialog clear $(name)

$function #bs.log:info {namespace:"actions",path:"close_gui",tag:"actions",message:[{"text":"Dialog closed ","color":"gray"},{"text":"by ","color":"dark_gray"},{"text":"$(name)","color":"white"}]}
