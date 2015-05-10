#!/bin/bash

if [ "$USER" = "vagrant" ]
then
  sh update_linux.sh
  sh update_rvm.sh
  sh update_ror.sh
  sh update_node.sh
  sh info.sh
else
  echo "You MUST be user 'vagrant' to execute this script."
fi

