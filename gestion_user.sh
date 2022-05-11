#!/bin/bash
source fonctions.sh
source yadd.sh

if [ $# -gt 0 ];then
 
	while getopts "hgvm" option
	do
		case $option in
			h)help
			;;
			g)yadd
			;;
			v)version
			;;
			m)menu
			;;
			*) show_usage 
		esac
	done
 
else echo "Option manquante."
show_usage
fi