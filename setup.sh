#!/bin/bash
clear
#colors
white="\033[1;37m"                                          ##
grey="\033[0;37m"                                           ##
purple="\033[1;35m"                                         ##
red="\033[1;31m"                                            ##
green="\033[1;32m"                                          ##
yellow="\033[1;33m"                                         ##
purple="\033[0;35m"                                         ##
cyan="\033[0;36m"                                           ##
cyan1="\033[1;36m"                                          ##
cafe="\033[0;33m"                                           ##
fiuscha="\033[0;35m"                                        ##
blue="\033[1;34m"                                           ##
l_red="\033[1;37;41m"                                       ##
nc="\033[0m"                                                ## 
pink="\e[95m"  
echo -e $yellow"Please wait...!"$white
echo
apt-get install ncurses-utils -y &> /dev/null
apt-get install python -y &> /dev/null && pip install lolcat &> /dev/null
clear
cd $HOME && rm -rf shorturl
spinner() {
        pid=$!
        spin='\|/-'
        i=0
        tput civis
        while kill -0 $pid 2>/dev/null
	do
                i=$(( (i+1) %4 ))
                printf "\r${cyan1}[${spin:$i:1}]${nc} ${cyan1} $lch"
                sleep .1
	done
     printf "\r ${green}[✔] ${nc} ${green} $dn";echo
        tput cnorm
}

function os () {
	cat /etc/os-release &> /dev/null 2>&1
	if [ "$?" -eq "0" ]; then
		OS=DEBIAN 
		BIN="/usr/bin"
		DRK="$HOME/shorturl"			
	else
		OS=TERMUX
		BIN="/data/data/com.termux/files/usr/bin"
		DRK="$HOME/shorturl"
	fi
}

rm -rf $BIN/St &> /dev/null
rm -rf $BIN/st &> /dev/null

function clone() {
	lch="Cloning shorturl...";dn="shorturl Cloned";echo
	(git clone https://github.com/E343IO/shorturl --quiet ${main} --depth=1) & spinner
}
lch="Updating pkg's...";dn="Updated."
apt update &> /dev/null && apt install curl -y &> /dev/null && apt install git -y &> /dev/null && apt-get install ncurses-utils -y &> /dev/null && apt-get install jp2a -y &> /dev/null && apt-get install figlet -y &> /dev/null && apt-get install ruby -y &> /dev/null && gem install lolcat -y &> /dev/null && $green apt-get install -y xdg-utils  & spinner

clone
sleep 5
clear
cd $DRK

#lch="Updating pkg's...";dn="Updated."
#apt update &> /dev/null && apt install curl -y &> /dev/null && apt install git -y &> /dev/null && apt-get install ncurses-utils -y &> /dev/null && apt-get install jp2a -y &> /dev/null && apt-get install figlet -y &> /dev/null && apt-get install ruby -y &> /dev/null && gem install lolcat -y &> /dev/null && $green apt-get install -y xdg-utils  & spinner
banner() {
clear
printf "\e[0m\n"
printf " $green                                                   
             ▄▄▄▄▄   
            ▀▀  ▀▓▌   ▄▄▄▄ ▄▄                   ▄▄   ▄▄▄▄▄▄▄  ▄▄
        ▄▓█▀▀▓░ ▓█▀  ▓▓░   ▓▓▄▄▄  ▄▄▄▄ ▄▄▄▄▄▓▓▄ ▓▓  ▐▓▌▐▓░▐▓▓ ▐▓
       ▓█▀ ▓▓▄▓█▀     ▀▀▓▓ ▓▓ ▐▓░▓▌ ▐▓▌▐▓░  ▐▓░ ▓▓  ▐▓▌▐▓▓▓▓  ▐▓    
       █▌▄ ▄▄▄       ▓▓▓▓▀ ▓▓ ▐▓░▀▓▒▓▀ ▐▓   ▐▓▓░ ▓▓▓▓▀ ▐▓  ▀▓▄▐▓▓▓▓ 
        ▀▀▀▀▀"                                                   
printf "                                                       $red v1.0.3"  
echo
printf "\e[0m\n"
printf "\e[0m\e[1;93m             $cafe Github :$yellow @E343IO  $pink Instagram :$cyan @e343io   "
}
os
banner
printf "\e[0m\n"
printf "\e[0m\n"
printf " \e[0m\e[1;91m[\e[0m\e[1;97m~\e[0m\e[1;91m]\e[0m\e[1;93m Installing Packages..\e[0m\n"
printf "\e[0m\n"
os
banner
sleep 2
printf "\e[0m\n"
printf "\e[0m\n"
printf "\e[0m\e[1;91m[\e[0m\e[1;97m~\e[0m\e[1;91m]\e[0m\e[1;93m Creating Environment...\e[0m\n"
printf "\e[0m\n"
sleep 2
os
lch="Creating Environment...";dn="Environment Created."
cd $DRK
sleep 2
cp -f shorturl $BIN/st
cp -f shorturl $BIN/St
#echo 'termux-open-url https://github.com/tech2gamer/' > $BIN/t2g
#echo 'termux-open-url https://github.com/tech2gamer/' > $BIN/T2g 
#echo 'termux-open-url https://www.instagram.com/tech2.gamer/' > $BIN/instagram 
#echo 'termux-open-url https://www.instagram.com/tech2.gamer/' > $BIN/Instagram
#chmod +x $BIN/t2g 
#chmod +x $BIN/t2g
#chmod +x $BIN/instagram 
#chmod +x $BIN/Instagram
chmod +x $BIN/st
chmod +x $BIN/St
sleep 2
printf "\e[0m\n"
printf "\033[1;32m[✔] Installation Succeed !! \e[0m\n"
#\e[0m\e[1;91m[\e[0m\e[1;97m~\e[0m\e[1;91m]
sleep 2
printf "\e[0m\n"
printf "\e[0m\n"
printf "\e[0m\e[1;91m[\e[0m\e[1;97m~\e[0m\e[1;91m]\e[0m\e[1;93m Type \e[0m\e[1;92mSt Or st \e[0m\e[1;93mto Run this Tool \e[0m\n"
printf "\e[0m\n"
printf "\e[0m\n"
os
