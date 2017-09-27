#!/bin/bash

IFS=", " 
acpi=$(acpi -b | grep -ioP '(\w+), (\d+)') 

status=$(echo $acpi | awk '{print $1}')
percentage=$(echo $acpi | awk '{print $2}')

if [ $status == 'Charging' ]; then
	status='\ue201'
elif [ $percentage -gt 79 ]; then
	status='\ue214'
elif [ $percentage -gt 49 ]; then
	status='\ue213'
elif [ $percentage -gt 29 ]; then
	status='\ue212'
else
	status='\ue211'
fi

echo -e $status
