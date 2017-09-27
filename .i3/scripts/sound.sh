#!/bin/bash


if [ $(pamixer --get-mute) == true ]; then
	status='\ue04f'
elif [ $(pamixer --get-volume) -gt 79 ]; then
	status='\ue05d'
elif [ $(pamixer --get-volume) -gt 49 ]; then
	status='\ue050'
else
	status='\ue04e'
fi

echo -e $status
