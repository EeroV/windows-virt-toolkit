#!/bin/bash

# read following parameters
#AdministratorPasswordValue=
#oslanguageandlocale=fi-fi
#FirewallState=yes
#OSType=win2k22
#UEFIorBIOS=bios

read -p "Administrator password : " admin

if [ ${#admin} -lt 12 ]
then
   echo "lenght of admin password is less than 12 chars"
   exit;
fi

read -p "Disable firewall (yes/no)" firewall

echo $firewall | grep -i "yes\|no" > /dev/null
RETVAL=$?

if [ $RETVAL -ne 0 ]
then
   echo "only yes or no accepted as value"
   exit
fi

read -p "OS version " ostype

echo $ostype |  grep -i  "win7\|win8\|win8.1\|win10\|win2k8\|win2k8r2\|win2k12\|win2k12r2\|win2k16\|win2k19\|win2k22" > /dev/null
RETVAL=$?


if [ $RETVAL -ne 0 ]
then
   echo 'only following os type is supported at this moment:  "win7","win8","win8.1","win10","win2k8","win2k8r2","win2k12","win2k12r2","win2k16","win2k19","win2k22"'
   exit
fi


read -p "uefi or bios " bios

echo $bios | grep -i "uefi\|bios" > /dev/null
RETVAL=$?

if [ $RETVAL -ne 0 ]
then
   echo "only uefi or bios accepted as value"
   exit
fi




read -p "locale (ex: fi-fi)" locale




echo "AdministratorPasswordValue=$admin" > settings.inc
echo "oslanguageandlocale=$locale" >> settings.inc
echo "OSType=$ostype" >> settings.inc
echo "UEFIorBIOS=$bios" >> settings.inc
echo "FirewallState=$firewall" >> settings.inc
