#!/bin/bash

# This script creates a basic Rails app that uses a PostgreSQL database.
# PURPOSE: Provide confirmation that Ruby on Rails and PostgreSQL are properly set up.

# REFERENCE: https://github.com/jackdb/pg-app-dev-vm

# Just making sure Ruby, Rails, and Node are working as expected.
sh /home/vagrant/shared/info.sh

APP_DB_NAME=database1
APP_DB_USER=user1
APP_DB_PASS=password1

sudo -u postgres psql -c"CREATE ROLE $APP_DB_USER WITH CREATEDB LOGIN PASSWORD '$APP_DB_PASS';"
sudo -u postgres psql -c"CREATE DATABASE $APP_DB_NAME WITH OWNER=$APP_DB_USER;"
wait

# This is the same test app as the one at http://elinux.org/RPi_Ruby_on_Rails 
# but with PostgreSQL instead of SQLite.

echo "*******************************************************"
echo "rails new school_pg --database=postgresql --skip-spring"
cd /home/vagrant/shared && rails new school_pg --database=postgresql --skip-spring
wait

echo "*******************************"
echo "Configuring config/database.yml"
cd /home/vagrant/shared/school_pg && mv config/database.yml config/database-orig.yml
cd /home/vagrant/shared/school_pg && echo "default: &default" > config/database.yml
cd /home/vagrant/shared/school_pg && echo "  adapter: postgresql" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "  encoding: unicode" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "  pool: 5" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "  database: $APP_DB_NAME" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "  username: $APP_DB_USER" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "  password: $APP_DB_PASS" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "development:" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "  <<: *default" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "test:" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "  <<: *default" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "production:" >> config/database.yml
cd /home/vagrant/shared/school_pg && echo "  <<: *default" >> config/database.yml

echo "**********************************************"
echo "rails g scaffold Pupil name:string form:string"
cd /home/vagrant/shared/school_pg && rails g scaffold Pupil name:string form:string
wait

echo "*************************"
echo "rake db:create db:migrate"
cd /home/vagrant/shared/school_pg && rake db:migrate
wait

echo "**********************"
echo "OPEN YOUR WEB BROWSER."
echo "GO TO THE FOLLOWING URL:"
echo "http://localhost:3000/pupils"
echo "*************************************************************"
echo "You can use access the database in this app by using pgAdmin."
echo "Host: localhost"
echo "Port: 15432"
echo "Maintenance DB: postgres"
echo "Username: $APP_DB_USER"
echo "Password: $APP_DB_PASS"
echo "Database name: $APP_DB_NAME"
echo "***************************"
cd /home/vagrant/shared/school_pg && rails s -b 0.0.0.0
