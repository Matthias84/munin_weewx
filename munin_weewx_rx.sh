#!/bin/sh

case $1 in
   config)
        cat <<'EOM'
graph_title WX connectivity
graph_vlabel rx signal quality
graph_category weather
graph_args --upper-limit 100 -l 0
graph_scale no
rx_perc.label rx
EOM
        exit 0;;
esac

printf "rx_perc.value "
wee_device --current |sed 's/\,/\n/g' | grep rxCheckPercent | cut -d: -f2 | tr -d '[:space:]'
