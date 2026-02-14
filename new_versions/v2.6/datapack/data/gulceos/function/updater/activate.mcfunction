$data modify storage mc:handler data.version set value "$(version)"

schedule function gulceos:updater/success 3s
