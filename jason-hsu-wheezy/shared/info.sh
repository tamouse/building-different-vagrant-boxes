#!/bin/bash

. ~/.nvm/nvm.sh # NVM command does not work in this script without this.

echo

TIME_STAMP="$(cat /home/vagrant/timestamp.txt)"
echo "Timestamp: ${TIME_STAMP}"

echo
rvm -v

rvm list rubies

echo
rails -v

echo
VERSION_NVM="$(nvm --version)"
echo "NVM: ${VERSION_NVM}"

echo
echo "Version of node.js:"
nvm list

echo
echo "Heroku Toolbelt:"
heroku version

echo
python --version

echo
VERSION_PUPPET="$(puppet master --version)"
echo "Version of Puppet: ${VERSION_PUPPET}"

echo
chef-solo -v

echo
redis-server -v

echo
echo "Version of SQLite:"
sqlite3 -version

echo
psql --version

echo
