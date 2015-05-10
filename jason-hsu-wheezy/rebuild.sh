#!/bin/bash

echo "------------"
echo "vagrant halt"
vagrant halt

echo "------------------"
echo "vagrant destroy -f"
vagrant destroy -f

sh login.sh
