#!/bin/bash
echo -e "La fecha del dia de hoy es:"
cat /proc/driver/rtc |grep 'rtc_date' | grep '[0-9]*-[0-9]*-[0-9]*' -Eo

echo "La hora actual es: "
printf "%(%H:%M:%S)T\n"


