#!/bin/sh

case $1 in
   config)
        cat <<'EOM'
graph_title WX battery
graph_vlabel state
graph_category weather
graph_scale no
bat.label battery
EOM
        exit 0;;
esac

printf "bat.value "
wee_device --current |sed 's/\,/\n/g' | grep outTempBatteryStatus | cut -d: -f2 | tr -d '[:space:]'
