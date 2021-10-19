#!/bin/bash

# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
	echo -e "\n${RED}${1}${NC}"
}
function GREEN(){
	echo -e "\n${GREEN}${1}${NC}"
}
function YELLOW(){
	echo -e "\n${YELLOW}${1}${NC}"
}
function BLUE(){
	echo -e "\n${BLUE}${1}${NC}"
}

# Testing if root...
if [ $UID -ne 0 ]
then
	RED "You must run this script as root!" && echo
	exit
fi



BLUE "Updating repositories..."
sudo apt update

BLUE "Updating certs..."
sudo apt install ca-certificates -y

BLUE "Getting Java JDK..."
sudo apt install -y default-jdk

BLUE "Installing git..."
sudo apt install -y git

BLUE "Downloading Ghidra..."
wget -O ghidra.zip https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.0.3_build/ghidra_10.0.3_PUBLIC_20210908.zip
unzip ghidra.zip
rm ghidra.zip

BLUE "Downloading and installing NordVPN..."
wget -O nord.deb https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
sudo apt install ~/nord.deb
sudo apt update
sudo apt install nordvpn


BLUE "Downloading gdb-peda..."
sudo git clone https://github.com/longld/peda.git ~/peda
sudo echo "source ~/peda/peda.py" >> ~/.gdbinit
sudo echo "DONE"


BLUE "Installing Sublime Text..." # according to https://www.sublimetext.com/docs/3/linux_repositories.html-
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-text

BLUE "Installing NodeJS..."
sudo apt-get install nodejs -y

BLUE "Installing js-beautify..."
sudo apt-get install jsbeautifier -y

BLUE "Installing strace..."
sudo apt-get install strace -y


BLUE "Installing terminator..."
sudo apt install terminator -y

#BLUE "Removing boilerplate home directories..."
#rmdir ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Public ~/Templates ~/Videos

BLUE "Installing exiftool..."
sudo apt install -y exiftool

BLUE "Installing python3-pip..."
sudo apt install python3-pip -y
sudo python3 -m pip install --upgrade pip


BLUE "Installing Python pwntools..."
sudo python3 -m pip install pwntools



