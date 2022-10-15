#!/bin/bash

# read following parameters
#AdministratorPasswordValue=
#oslanguageandlocale=fi-fi
#FirewallState=yes
#OSType=win2k22
#UEFIorBIOS=bios

read -p "Administrator password : " admin
read -p "Disable firewall (yes/no)" firewall
read -p "OS version " ostype
read -p "uefi or bios " bios
read -p "locale (ex: fi-fi)" locale

echo "AdministratorPasswordValue=$admin" > settings.inc
echo "oslanguageandlocale=$locale" >> settings.inc
echo "OSType=$ostype" >> settings.inc
echo "UEFIorBIOS=$bios" >> settings.inc
echo "FirewallState=$firewall" >> settings.inc
