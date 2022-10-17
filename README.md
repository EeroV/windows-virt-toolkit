# windows-virt-toolkit

This is fork from: https://github.com/mattshortland/windows-virt-toolkit to add some functionality that is missing from original.

Powershell Scripts to automate VM Setup on QEMU / KVM

This script will download dependencies and drivers for QEMU / Spice / SSH and will create an ISO to automatically install your guest OS

Dependencies required to be able to run this script:
  QEMU/KVM
  libvirt
  virt-manager
  PowerShell
  libisotools
  unzip
  gunzip


SETUP INFO

Only Windows versions below are supported for now

 Microsoft Windows Server 2022                      
 Microsoft Windows Server 2008                      
 Microsoft Windows Server 2008 R2                   
 Microsoft Windows Server 2012                      
 Microsoft Windows Server 2012 R2                   
 Microsoft Windows Server 2016                      
 Microsoft Windows Server 2019                       
 Microsoft Windows 10                               
 Microsoft Windows 8.1                              
 Microsoft Windows 8                                 
 Microsoft Windows 7                              
  

Instructions:

Use generate-settings.sh to fill needed values or create settings.inc manually.


USING THE SCRIPT

run powershell createautobuildcd.ps1 to start files generation
script will prompt for the OS version and if you want UEFI or BIOS, and verify this will work
script will check for exisiting downloaded support files, and if they dont exist fetch them into a Toolkit folder
Script will then extract the drivers and support files for all OS versions
Script will then create an ISO file in the script directory called %osversion%-setup.iso (for example win7-setup.iso)

ADDING THE ISO TO YOUR VM

I will assume if you are using QEMU / VIRSH you know how to do this

When you create your vm in Virtual Machine Manager, choose "customize configuration before install" on the last page
Choose Add Hardware > Storage > Device Type > CDROM
choose the setup iso that was created, click finish then choose Install Now

Windows will begin installation and when completed will log on and finish installing the tools 


Misc notes: (from: https://wiki.debian.org/KVM#Disk_I.2FO)
- how to change disk driver to virt-io:
- before shutdown issue following command in cmd.exe as admin: bcdedit /set {current} safeboot minimal
- shutdown quest and remove main disk. add main disk with virt-io driver and same storage file
- exit safe mode with msconfig and reboot or
- exit safe mode with command bcdedit /deletevalue {current} safeboot
- and reboot 
 
