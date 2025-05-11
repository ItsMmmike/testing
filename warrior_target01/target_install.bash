#!/bin/bash
# Script used to setup basic demo range target system (Rocky 9)
# To Use: "wget https://raw.githubusercontent.com/itsmmmike/testing/refs/heads/main/warrior_target01/target_install.bash" && sudo bash ./target_install.bash"

# Update and Install Packages
sudo yum update -y
sudo yum install nginx -y
sudo yum install wget -y
sudo yum install vim -y

# Clear Default Nginx Config (Danger!)
sudo rm /usr/share/nginx/html/*

# Download Nginx Config Files
sudo wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/ItsMmmike/testing/refs/heads/main/warrior_target01/nginx.conf"
sudo wget -O /usr/share/nginx/html/index.html "https://raw.githubusercontent.com/ItsMmmike/testing/refs/heads/main/warrior_target01/index.html"
sudo wget -O /usr/share/nginx/html/You_Tried.png "https://raw.githubusercontent.com/ItsMmmike/testing/refs/heads/main/warrior_target01/You_Tried.png"
sudo wget -O /usr/share/nginx/html/flag_demo.7z "https://raw.githubusercontent.com/ItsMmmike/testing/refs/heads/main/warror_target01/flag_demo.7z"

# Enable and Start Server
sudo systemctl enable nginx
sudo systemctl restart nginx

# Enable Firewall Ports
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --remove-service=ssh --permanent
sudo firewall-cmd --reload
