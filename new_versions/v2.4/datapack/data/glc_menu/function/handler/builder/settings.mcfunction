$data modify storage custom:storage config.dialog set value "$(flag)"

execute if data storage custom:storage {config:{dialog:"no_loader"}} run function glc_menu:handler/builder/show_settings1
execute if data storage custom:storage {config:{dialog:"enabled_loader"}} run function glc_menu:handler/builder/show_settings2

data remove storage custom:storage config.dialog