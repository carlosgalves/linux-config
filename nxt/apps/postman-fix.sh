#!/bin/bash

sudo dnf -y install openssl

cd ~/.var/app/com.getpostman.Postman/config/Postman/proxy

sudo openssl req -subj '/C=US/CN=Postman Proxy' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout postman-proxy-ca.key -out postman-proxy-ca.crt