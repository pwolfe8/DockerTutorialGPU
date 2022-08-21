#!/bin/bash

sudo apt update && \
sudo apt install -y `ubuntu-drivers devices | grep recommended | awk '{print $3}'`

echo ""
echo "finished installing nvidia drivers"
echo "please reboot your machine to finish setup" 
echo ""
  
