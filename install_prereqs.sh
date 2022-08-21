#!/bin/bash

# install scripts folder
INSTALL="./install_scripts"

# install docker & docker compose
$INSTALL/install_docker_tools.sh

# check for nvidia drivers before continuing (requires reboot after install)
DRIVER_PKG=`ubuntu-drivers devices | grep recommended | awk '{print $3}'`
NVDRIV_INST=`dpkg -s $DRIVER_PKG | grep "install ok installed" | awk '{print $4}'`
echo "nvdrive_inst $NVDRIV_INST"
if [ "$NVDRIV_INST" == "installed" ]; then
    echo "nvidia drivers installed"
else
    echo ""
    read -p "nvidia drivers not found. would you like to install them(requires reboot)? (y/n): " response
    if [ "$response" == "y" ]; then 
        echo "installing..."
        $INSTALL/install_nvidia_drivers.sh
    else
        echo "you must install them before continuing! rerun this script when ready. exiting..."
    fi
    exit
fi

# install nvidia docker2 package if needed (for docker GPU passthrough )
NVDOCK_INST=`dpkg -s nvidia-docker2 | grep "install ok installed" | awk '{print $4}'`
if [ "$NVDOCK_INST" != "installed" ]; then
    echo "nvidia-docker2 package not yet installed. installing..."
    $INSTALL/install_nvidiadocker2.sh
fi

echo ""
echo "May need to reboot your machine to finish setup" 
echo ""