#!/bin/bash

wget -O tempModuleDB.html https://pypi.org/simple/

if [[ "$1"=="auto" ]]; then
	read -p "What term would you like to search for? " search
	for i in $(cat tempModuleDB.html | grep $search | awk -F"/" '{print $3}'); do
		echo "##########################################################################"
		echo "# Installing $i                                                          #"
		echo "##########################################################################"
		sudo pip3 install $i
	done
	echo "##########################################################################"
	echo "# Done!                                                                  #"
	echo "##########################################################################"


	exit
fi


read -p "What term would you like to search for? " search
for i in $(cat tempModuleDB.html | grep $search | awk -F"/" '{print $3}'); do
	read -p "do you wish to install $i? (Yes/No/Cancel) " answer
	case ${answer:0:1} in
	[yY]* )
		echo "Installing $i"
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