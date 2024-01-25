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
fi

# MySQL
echo "Installing mariadb..."
if sudo dnf -y install mariadb-server; then
    sudo systemctl start mariadb
    sudo systemctl enable mariadb
    sudo chmod +x development/mysql_secure_installation.sh && sudo ./development/mysql_secure_installation.sh
    mysql_version=$(mysql --version | awk '{print $5}')
    echo "[SUCCESS] MySQL/MariaDB (version $mysql_version)" >> "$log_file"
else
    echo "[FAILURE] MySQL/MariaDB" >> "$log_file"
fi

# PHP
echo "Installing php..."
if sudo dnf -y install php php-mysqlnd php-fpm phpmyadmin; then
    php_version=$(php -v | grep -oP 'PHP \K[0-9]+\.[0-9]+')
    sudo systemctl restart httpd
    echo "[SUCCESS] PHP (version $php_version)" >> "$log_file"
else
    echo "[FAILURE] PHP" >> "$log_file"
fi