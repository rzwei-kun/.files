#!/bin/bash

temp=$(</sys/class/thermal/thermal_zone5/temp) 
temp=$(bc -l <<< $temp/1000)

printf "%.1f°C\n" $temp
