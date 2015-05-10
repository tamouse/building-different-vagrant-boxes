#!/bin/bash

if [ "$USER" = "vagrant" ]
then
  sudo apt-get update
  sudo apt-get upgrade -y
  
  # Clean up
  sudo apt-get -y clean;
  sudo rm -rf /usr/share/doc;
  sudo find /var/cache -type f -exec rm -rf {} \;
  sudo find /usr/share/locale/* -maxdepth 1 -type d ! -name "en*" -exec rm -rf {} \;

  # Clean up guest additions (no longer needed by VirtualBox)
  sudo rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?;
  sudo rm -rf /usr/src/virtualbox-ose-guest*;
  sudo rm -rf /usr/src/vboxguest*;

  # Clean up Linux headers
  sudo rm -rf /usr/src/linux-headers*;
  sudo rm -rf /usr/src/linux;

  # Remove history file
  sudo unset HISTFILE;
  sudo rm ~/.bash_history /home/vagrant/.bash_history;

else
  echo "You MUST be user 'vagrant' to execute this script."
fi

