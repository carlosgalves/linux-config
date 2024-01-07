#!/bin/sh
sudo dnf update -y

echo "****************************************************************"
echo "LAMP installation"
echo "****************************************************************"

# Apache
echo "Installing apache..."
sudo dnf -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd

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

# Print service status
#echo
#echo "Service Status:"
#echo "----------------"
#echo "Apache Status:"
#sudo systemctl status httpd
#echo

#echo "MySQL Status:"
#sudo systemctl status mariadb
#echo

#echo "PHP info:"
#sudo php -v
#echo

#echo "Opening phpMyAdmin..."
#xdg-open http://localhost/phpmyadmin
#echo