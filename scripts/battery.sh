#!/bin/zsh

BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')
CHR=$(acpi -b | grep -E -o '(Charging|Discharging)')
RED='\033[0;31m'
NC='\033[0m' # No Color

[[ $CHR == "Discharging" ]] && CHR=''

[[ ${BAT%?} -ge 90 && ${CHR} == "Charging" ]] && echo "$BAT  "
[ ${BAT%?} -le 10 ] && [ ${CHR} = "Charging" ] && echo "$BAT  "
[ ${BAT%?} -le 25 ] && [ ${CHR} = "Charging" ] && echo "$BAT  "
[ ${BAT%?} -le 50 ] && [ ${CHR} = "Charging" ] && echo "$BAT  "
[ ${BAT%?} -le 75 ] && [ ${CHR} = "Charging" ] && echo "$BAT  "
[[ ${BAT%?} -le 89 && $CHAR == "Charging" ]] && echo "$BAT  "

[ ${BAT%?} -ge 90 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 10 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 25 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 50 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 75 ] && echo "$BAT  $CHR"
[ ${BAT%?} -le 89 ] && echo "$BAT  $CHR"

