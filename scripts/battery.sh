#!/bin/zsh

BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')
CHR=$(acpi -b | grep -E -o '(Charging|Discharging)')

[[ $CHR == "Discharging" ]] && CHR=''


[ ${BAT%?} -ge 85 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 84 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 70 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 50 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 20 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 5 ] && echo "#f12711"

