#!/bin/zsh

BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')
CHR=$(acpi -b | grep -E -o '(Charging|Discharging)')
COLOR_GREEN=${COLOR_GREEN:-#00FF00}
COLOR_LOWR=${COLOR_LOWR:-#FFF600}
COLOR_DOWN=${COLOR_DOWN:-#FF0000}

[[ ${BAT%?} -ge 90 && ${CHR} == "Charging" ]] && echo "$BAT  "
[[ ${BAT%?} -le 10 && ${CHR} == "Charging" ]] && echo "$BAT  "
[[ ${BAT%?} -le 25 && ${CHR} == "Charging" ]] && echo "$BAT  "
[[ ${BAT%?} -le 50 && ${CHR} == "Charging" ]] && echo "$BAT  "
[[ ${BAT%?} -le 75 && ${CHR} == "Charging" ]] && echo "$BAT  "
[[ ${BAT%?} -le 89 && $CHR == "Charging" ]] && echo "$BAT  "

if [[ ${CHR} == "Charging" ]]; then
  echo $COLOR_GREEN
fi

[ ${BAT%?} -ge 90 ] && echo "$BAT  "
[ ${BAT%?} -le 10 ] && echo "$BAT  "
[ ${BAT%?} -le 25 ] && echo "$BAT  "
[ ${BAT%?} -le 50 ] && echo "$BAT  "
[ ${BAT%?} -le 75 ] && echo "$BAT  "
[ ${BAT%?} -le 89 ] && echo "$BAT  "

if [[ ${BAT%?} -le 25 ]]; then
  echo $COLOR_LOWR
elif [[ ${BAT%?} -le 10 ]]; then
  echo $COLOR_DOWN
fi

