#!/bin/bash

curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg \
   --dearmor
   
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

apt-get update

sudo apt-get install -y \
   mongodb-org=6.0.16 \
   mongodb-org-database=6.0.16 \
   mongodb-org-server=6.0.16 \
   mongodb-mongosh \
   mongodb-org-shell=6.0.16 \
   mongodb-org-mongos=6.0.16 \
   mongodb-org-tools=6.0.16 \
   mongodb-org-database-tools-extra=6.0.16
   
systemctl daemon-reload
systemctl start mongod
systemctl enable mongod