#!/bin/bash

if [ "$USER" = "vagrant" ]
then
  echo "node.js update deactivated"
  # . ~/.nvm/nvm.sh # Activate NVM
  # nvm install stable
  # nvm use stable
  # nvm list
else
  echo "You MUST be user 'vagrant' to execute this script."
fi

