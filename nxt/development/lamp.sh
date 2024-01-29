#!/bin/bash
log_file="log.txt"

sudo dnf update -y

echo "****************************************************************"
echo "LAMP installation"
echo "****************************************************************"

# Apache
echo "Installing apache..."
if dnf -y install httpd; then
    systemctl start httpd
    systemctl enable httpd
    echo "[SUCCESS] Apache" >> "$log_file"
else
    echo "[FAILURE] Apache" >> "$log_file"
fi

# MySQL
echo "Installing mariadb..."
if dnf -y install mariadb-server; then
    systemctl start mariadb
    systemctl enable mariadb
    chmod +x development/mysql_secure_installation.sh && ./development/mysql_secure_installation.sh
    mysql_version=$(mysql --version | awk '{print $5}')
    echo "[SUCCESS] MySQL/MariaDB (version $mysql_version)" >> "$log_file"
else
    echo "[FAILURE] MySQL/MariaDB" >> "$log_file"
fi

# PHP
echo "Installing php..."
if dnf -y install php php-mysqlnd php-fpm phpmyadmin; then
    php_version=$(php -v | grep -oP 'PHP \K[0-9]+\.[0-9]+')
    systemctl restart httpd
    echo "[SUCCESS] PHP (version $php_version)" >> "$log_file"
else
    echo "[FAILURE] PHP" >> "$log_file"
fi