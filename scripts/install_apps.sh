#!/bin/bash

#Script to install some of the required packages
#Author: Juho "Qurred" Kuusinen

#List of installable packages
declare -a packages=(
	"i3" 		#Our enviroment
	"i3blocks"	#Stuff to i3 status bar
	"scrot"		#Screenshot software
	"vlc"		#Mediaplayer
	"git"		#Git
	"gitg"		#GUI for the git
	"openjdk-8-jdk"	#Java 8 JDK
	"openjdk-8-jre"	#Java 8 JRE
	"ranger"	#Good TUI filebrowser
	"chromium"	#My preferred browser
	"compton"	#Animations and transparenzz
	"rxvt-unicode"	#My favorite terminal
	"rofi"		#Replaces dmenu
)


if [ -f /etc/os-release ]; then
	. /etc/os-release
	OS=$ID
else
	echo "Could not find /etc/os-release"
fi

echo "Your distros id is $OS"

if [[ $OS == "arch" ]]; then 
	COMMAND="pacman -S"
	packages=("${packages[@]}" "yaourt")
elif [[ $OS == "ubuntu" ]]; then COMMAND="apt-get install"
else echo "Your disto isn't supported"; exit;
fi

echo "Do you want to continue and install packages?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) break;;
		No ) exit;;
	esac
done

#Main loop
for package in "${packages[@]}"
do
	sudo $COMMAND -y $package
done 



