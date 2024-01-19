#!/bin/bash
log_file="log.txt"

sudo dnf update -y

echo "****************************************************************"
echo "LAMP installation"
echo "****************************************************************"

# Apache
echo "Installing apache..."
if sudo dnf -y install httpd; then
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "[SUCCESS] Apache" >> "$log_file"
else
    echo "[FAILURE] Apache" >> "$log_file"
    exit 1
fi



# MySQL
echo "Installing mariadb..."
sudo dnf -y install mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb

sudo chmod +x development/mysql_secure_installation && sudo ./development/mysql_secure_installation.sh

# PHP
echo "Installing php..."
sudo dnf -y install php php-mysqlnd php-fpm phpmyadmin

sudo systemctl restart httpd
