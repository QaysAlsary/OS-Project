#!/bin/bash
source core.sh

dbname=$1
options=("insert a record" "delete a record" "search for a record" "update a record" "Quit")
while [[ "$option" != "Quit" ]] 
do
export dbname
	select option in "${options[@]}"
	do
	
		case $option in
			"insert a record") insert;
			 break ;;
			"delete a record") delete; break ;;
			"search for a record") search; break ;;
			"update a record") update; break ;;
			"Quit")  break; exit $?;;
			*) echo "Invalid option $REPLY";;
		esac
	done
	
done
./backUp
