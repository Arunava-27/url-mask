#!/bin/bash

clear
##############################################################
#                 C O L O U R S                              #
##############################################################
orange='\033[0;33m'                                         ##
white="\033[1;37m"                                          ##
grey="\033[0;37m"                                           ##
purple="\033[1;35m"                                         ##
red="\033[1;31m"                                            ##
green="\033[1;32m"                                          ##
yellow="\033[1;33m"                                         ##
purple="\033[0;35m"                                         ##
cyan="\033[0;36m"                                           ##
cyan1="\033[1;36m"                                          ##
sta="\e[5m"                                                 ##
cafe="\033[0;33m"                                           ##
fiuscha="\033[0;35m"                                        ##
sto="\e[25m"                                                ##
blue="\033[1;34m"                                           ##
l_red="\033[1;37;41m"                                       ##
nc="\033[0m"                                                ## 
pink="\e[95m"                                               ##
##############################################################
error_msg() {
        printf "${red}[!] ${white}${1}\n${nc}"
}
function check_root() {
        if [ "$(whoami &2>/dev/null)" != "root" ] && [ "$(id -un &2>/dev/null)" != "root" ];then
                echo ""
                echo ""
                error_msg "Admin user detected\n"
                error_msg "You must be root to run this script!\n"
                error_msg "Use 'sudo !!'\n"
                exit 1
	fi
}

function os () {
	cat /etc/os-release &> /dev/null 2>&1
	if [ "$?" -eq "0" ]; then
		OS=DEBIAN 
		BIN="/usr/bin"
                check_root	
	else
		OS=TERMUX
		BIN="${PREFIX}/bin"
	fi
}
upd () {

	if [[ $OS == DEBIAN ]]; then
        sudo wget -qO- https://github.com/E343IO/shorturl/raw/main/setup | sudo bash
else
	wget -qO- https://github.com/E343IO/shorturl/raw/main/setup | bash
	fi
}
rmst () {
os;printf "\e[32mDo you wish to delete all files ? y/n :\e[0m";read rmt && [ "$rmt" != "${rmt#[Yy]}" ];rm -rf ${BIN}/st St t2g T2g instagram Instagram
}
usage () {
cat <<EOF
Usage: $(basename $0) 
[OPTIONS] available
-h, --help        You know for what it is.
-p, --purge       remove shorturl
-u, --update      To update tool
EOF
}

while true; do
        case "$1" in 
              
               -h|--help)			
                   usage       
                   exit 1
                    ;;
           

               -p|--purge) 
	              rmst
	              exit 1
                   ;;
	       
	       -u|--update)
		      upd
		      exit 1
		       ;;
           
           -*)			
                  echo "ERROR: unknown option '$1'" 1>&2
                  echo "Usage -h or --help " 1>&2
                  exit 1
                  ;;
            
            *)	
                  f=$1
                  break			
                  ;;
	esac
        shift
done

banner() {
clear
printf "\e[0m\n"
printf " $green                                                   

███████╗██████╗░░█████╗░███╗░░░███╗  ████████╗██╗░░██╗███████╗  ██╗░░██╗░█████╗░██╗░░░██╗░██████╗███████╗
██╔════╝██╔══██╗██╔══██╗████╗░████║  ╚══██╔══╝██║░░██║██╔════╝  ██║░░██║██╔══██╗██║░░░██║██╔════╝██╔════╝
█████╗░░██████╔╝██║░░██║██╔████╔██║  ░░░██║░░░███████║█████╗░░  ███████║██║░░██║██║░░░██║╚█████╗░█████╗░░
██╔══╝░░██╔══██╗██║░░██║██║╚██╔╝██║  ░░░██║░░░██╔══██║██╔══╝░░  ██╔══██║██║░░██║██║░░░██║░╚═══██╗██╔══╝░░
██║░░░░░██║░░██║╚█████╔╝██║░╚═╝░██║  ░░░██║░░░██║░░██║███████╗  ██║░░██║╚█████╔╝╚██████╔╝██████╔╝███████╗
╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░╚═╝  ░░░╚═╝░░░╚═╝░░╚═╝╚══════╝  ╚═╝░░╚═╝░╚════╝░░╚═════╝░╚═════╝░╚══════╝

░█████╗░███████╗  ██╗███████╗███╗░░░███╗██╗░░░░░░█████╗░██████╗░░██████╗
██╔══██╗██╔════╝  ██║██╔════╝████╗░████║██║░░░░░██╔══██╗██╔══██╗██╔════╝
██║░░██║█████╗░░  ██║█████╗░░██╔████╔██║██║░░░░░███████║██████╦╝╚█████╗░
██║░░██║██╔══╝░░  ██║██╔══╝░░██║╚██╔╝██║██║░░░░░██╔══██║██╔══██╗░╚═══██╗
╚█████╔╝██║░░░░░  ██║███████╗██║░╚═╝░██║███████╗██║░░██║██████╦╝██████╔╝
░╚════╝░╚═╝░░░░░  ╚═╝╚══════╝╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚═╝╚═════╝░╚═════╝░"                                                   
printf "                                                       $red v1.0.3"  
echo
printf "                $yellow ⚡️ $red$sta Short Your Url Quickly $sto$yellow⚡️\n\n"

printf "\e[0m\n"
printf "\e[0m\e[1;93m   $cafe Github :$yellow @Arunava27\n\n"
}
banner
check () {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Invalid URL. Please use http:// or https://.\e[0m \n"
	    echo -e "\e[32m type st or St to run tool again."
	    sleep 1
	    exit 1
        fi
    fi
}
 
tiny () { 
banner \n
echo""
echo
echo
read -p $'\e[1;32m\e[96m URL Shortner from Tinyurl \e[1;91m YOUR URL •》: \e[0m' ty
echo"" 
if [[ $ty == $ty ]]; then
	short=$(curl -s http://tinyurl.com/api-create.php?url=$ty)
	echo
	echo
clear
	printf "$black🔰$orange$black U$white $black R$green $black L 🔰"
        printf " $black $cyan ------》$green $black•》$cafe$black $short $green $black《•$black $cyan《------- \n"
sleep 03
exit
fi
}
1ser() {
clear
banner /n
sleep 1.5
echo""
echo
read -p $'\e[1;40m\e[1;32m Your Url : \e[0m' ng
echo
check $ng
if [[ ! -z $ng ]]; then
       curl -s https://api.shrtco.de/v2/shorten?url=${ng} >> log.URI 
        grep -o 'https:[^"]*' log.URI >> bURI
        rm log.URI
        sed 's/\\//g' bURI >> uri.log
        rm bURI
        short=$(grep -o 'https://9qr.de/[-0-9a-zA-Z]*' "uri.log")
        shorter=${short#https://}
        read -p $'\n\033[1;92mDrk \033[1;97m>> \033[1;37mMask Your url domain here \033[1;93m(Ex. https://google.com) : \e[0m' ngrl
        check $ngrl
	printf "\033[1;92mDrk >> $yellow Enter your key words -: Ex. join-club-login\n"
        printf "\033[1;92mDrk >> $yellow Don't use space in your words\n"
        read -p $'\e[1;92mDrk\033[1;97m >> \e[1;37mEnter your words here :\e[0m ' stuff 
	echo
	echo
	sleep 2
	clear
	echo
	echo
        printf "$black🔰$orange$black U$white $black R$green $black L 🔰"
        printf " $black $cyan ------》$green $black•》$cafe$black $ngrl-$stuff@$shorter $green $black《•$black $cyan《------- \n\n\n"
        exit 1
fi
}
Drkopt() {
clear
banner
sleep 1.5
printf "\e[0m\n"
echo
printf " \e[0m\e[1;91m[\e[0m\e[1;97m01\e[0m\e[1;91m]\e[0m\e[1;32m SERVER - 1 $yellow(\e[1;32m •stable $yellow) \e[0m\n"
echo
printf " \e[0m\e[1;91m[\e[0m\e[1;97m02\e[0m\e[1;91m]\e[0m\e[1;32m SERVER - 2 $yellow(\e[1;32m •stable $yellow)\e[0m\n"
echo
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' numbr
if [[ $numbr == "1" || $numbr == "01" ]]; then
     ngrk
elif
 [[ $numbr == "2" || $numbr == "02" ]]; then
     1ser
else
      echo
      printf $red"❌Wrong Input❌"
      sleep 1.5 
      Drkopt
fi
}
ngrk () {
banner
sleep 1.5
echo
echo
echo""
read -p $'\e[1;40m\e[1;32m Your Url : \e[0m' ng
echo
check $ng
echo
echo""
if [[ $ng == $ng ]]; then
	clear
	banner
	echo
	echo
	msk=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${ng})
        msk1=$(curl -s https://da.gd/s/?url=${ng})
	mask=${msk#https://}
	mask1=${msk1#https://}
        read -p $'\n\033[1;92mDrk \033[1;97m>> \033[1;37mMask Your url domain here \033[1;93m(Ex. https://google.com) : \e[0m' ngrl
        check $ngrl
	printf "\033[1;92mDrk >> $yellow Enter your key words -: Ex. join-club-login\n"
        printf "\033[1;92mDrk >> $yellow Don't use space in your words\n"
        read -p $'\e[1;92mDrk\033[1;97m >> \e[1;37mEnter your words here :\e[0m ' stuff 
	echo
	echo
	sleep 2
	clear
	echo
	echo
	echo
	printf "$black🔰$orange$black U$white $black R$green $black L 🔰"
        printf " $black $cyan ------》$green $black•》$cafe$black $ngrl-$stuff@$mask $green $black《•$black $cyan《------- \n"
	printf $green"______________________________________________________________________________\n\n"
	printf "$black🔰$orange$black U$white $black R$green $black L 🔰"
        printf " $black $cyan ------》$green $black•》$cafe$black $ngrl-$stuff@$mask1 $green $black《•$black $cyan《------- \n"
sleep 03
echo
echo
echo
exit
fi
}
startup() {
printf "\e[0m\n"
echo
printf " \e[0m\e[1;91m[\e[0m\e[1;97m01\e[0m\e[1;91m]\e[0m\e[1;32m Your Phishing Url $yellow(\e[1;34mMaskable$yellow) \e[0m\n"
echo
printf " \e[0m\e[1;91m[\e[0m\e[1;97m02\e[0m\e[1;91m]\e[0m\e[1;32m Tinyurl $yellow(\e[1;31mnon maskable$yellow)\e[0m\n"
echo
printf " \e[0m\e[1;91m[\e[0m\e[1;97m03\e[0m\e[1;91m]\e[0m\e[1;32m About Us\e[0m\n"
echo
printf " \e[0m\e[1;91m[\e[0m\e[1;97mx\e[0m\e[1;91m]\e[0m\e[1;32m Exit\e[0m\n"
echo
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' num

if [[ $num == 1 || $num == 01 ]]; then
Drkopt
elif [[ $num == 2 || $num == 02 ]]; then
tiny
elif [[ $num == 3 || $num == 03 ]]; then
xdg-open https://www.github.com/E343IO/
sleep 5
elif [[ $num == x || $num == X ]]; then
clear
exit
else
echo
printf $red"❌Wrong Input❌"
sleep 1.5
st
fi
}
os
startup