#!/bin/bash
#
#Network config for Ubuntu 18###
################################
#
if [ -x "/usr/sbin/netplan" ]
then
#
#Define IP###
#
   echo -e "Define IP: \c"
#
read IP
#
   echo "      addresses:" ""[""$IP\/24"]" >> /etc/netplan/*yaml
#
netplan apply
#
   echo "Job done.....Exit"
#
#Network Configuration for Debian###
####################################
#
elif [ -f /etc/network/interfaces ]
then
#
   echo
   echo
   echo Current Interfaces....
   echo
   echo
ifconfig
#
#Obtain Variable Value###
#
   echo
   echo
   echo -e "Please chose the right logical name for the interface: \c"
#
read Interface
#
#Append to /etc/network/interface###
#
   echo auto $Interface >> /etc/network/interfaces
   echo iface $Interface inet static >> /etc/network/interfaces
#
   echo -e "Define IP: \c"
#
read IP
#
   echo address $IP >> /etc/network/interfaces
#
   echo -e "define Netmask: \c"
#
read Netmask
#
   echo natmask $Netmask >> /etc/network/interfaces
#
#Bringing up New Interface###
#
ifup $Interface
#
   echo "Job Done....Exit"
#
#Network config for CentOS
#########################
#
elif [ -d "/etc/sysconfig/network-scripts/" ]
then
#
   echo
   echo
   echo Current Interfaces.....
   echo
   echo
ip a l
###Obtain Variable Value#
   echo
   echo
   echo
   echo -e "Please chose the right logical name for the interface: \c"
#
read Interface
#
#
#Create and fillup file###
#
touch /etc/sysconfig/network-scripts/ifcfg-$Interface
    echo BOOTPROTO="static" >> /etc/sysconfig/network-scripts/ifcfg-$Interface
    echo DEVICE="$Interface" >> /etc/sysconfig/network-scripts/ifcfg-$Interface
    echo ONBOOT="yes" >> /etc/sysconfig/network-scripts/ifcfg-$Interface
    echo IPV6INIT="no" >> /etc/sysconfig/network-scripts/ifcfg-$Interface
#
#
#Define IP###
#
echo -e "Define IP: \c"
#
read IP
#
    echo IPADDR="$IP" >> /etc/sysconfig/network-scripts/ifcfg-$Interface
#
#Define Netmask###
#
   echo -e "Define Netmask: \c"
#
read Netmask
#
   echo NETMASK="$Netmask" >> /etc/sysconfig/network-scripts/ifcfg-$Interface
#
#Bring Up New Interface###
#
   echo "Bringing up new interface..."
#
ifup $Interface
#
   echo "Job Done....Exit"



else

echo "Unsupported Operating System....:("
        exit 1
fi
