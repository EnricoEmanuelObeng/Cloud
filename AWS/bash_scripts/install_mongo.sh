#!/bin/bash

# Update the packages
sudo apt update -y

# Upgrade the packages
sudo apt upgrade -y

echo 'Installing MongoDB'

# Install gnupg which is needed to import the MongoDB public GPG Key
# gnupg is a complete and free implementation of the OpenPGP standard
sudo apt-get install gnupg curl

# download MongoDB's GPG key and add it to a specific keyring file
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
   --dearmor

# Create a list file for MongoDB
# The list file tells apt-get where to download the MongoDB packagesecho "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

# Reload the local package database again
sudo apt-get update

# Install the MongoDB packages
sudo apt-get install -y mongodb-org

# Although you can specify any available version of MongoDB,
# apt-get will upgrade the packages when a newer version becomes available.
# To prevent unintended upgrades, you can pin the package at the currently installed version:

# Start MongoDB
sudo systemctl enable mongod
sudo systemctl start mongod

echo 'MongoDB installed and started'

# Path to your mongod.conf file
sudo /etc/mongod.conf

# Use sed to replace "bindIp: 127.0.0.1" with "bindIp: 0.0.0.0"
sudo sed -i 's/  bindIp: .*/  bindIp: 0.0.0.0/' /etc/mongod.conf

# Restart MongoDB
sudo systemctl restart mongod

echo 'MongoDB is now accessible'