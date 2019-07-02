#!/bin/bash

wget -O tempModuleDB.html https://pypi.org/simple/

read "What term would you like to search for?" search
for i in $(cat index.html | grep $search | awk -F"/" '{print $3}'); do
	echo "do you wish to install $i ? (yes/no/cancel)" 
	read answer
	case ${answer:0:1} in
    [yY]* )
        sudo pip3 install $i
    ;;
    [cC]* )
		echo "Exiting..."
		exit
	;;
    * )
        echo "Module $i skipped."
    ;;
	esac
	
done


rm -f tempModuleDB.html