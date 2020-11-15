#!/bin/zsh

BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')
CHR=$(acpi -b | grep -E -o '(Charging|Discharging)')

[[ $CHR == "Discharging" ]] && CHR=''


[ ${BAT%?} -ge 76 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 75 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 50 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 25 ] && echo "$BAT  $CHR"
#[ ${BAT%?} -le 20 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 5 ] && echo "#f12711" && echo "$BAT  $CHR"

