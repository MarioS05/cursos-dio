#!/bin/bash

echo "Atualizando o Servidor..."
apt-get update && apt-get upgrade -y

echo "Instalando o Apache..."
apt-get install apache2 -y

echo "Instalando o Unzip..."
apt-get install unzip -y

echo "Baixando a solução do endereço do Github..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -R * /var/www/html/

