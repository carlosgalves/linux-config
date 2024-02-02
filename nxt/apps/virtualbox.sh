#!/bin/bash

source helpers/check-installation.sh

#wget -qO oracle_vbox_2016.asc https://www.virtualbox.org/download/oracle_vbox_2016.asc

#sudo rpm --import oracle_vbox_2016.asc

sudo dnf -y install https://download.virtualbox.org/virtualbox/7.0.14/VirtualBox-7.0-7.0.14_161095_fedora36-1.x86_64.rpm