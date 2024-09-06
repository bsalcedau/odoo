#!/bin/bash

#Instalacion de postgresql
sudo apt update
sudo apt install postgresql -y

#Descarga e instalacion de wkhtmltopdf
wget -q -P /tmp https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.jammy_amd64.deb
sudo dpkg -i --force-all /tmp/wkhtmltox_0.12.6.1-3.jammy_amd64.deb
sudo apt install -f -y

#Descarga e instalacion de la clave en el repositorio
wget -q -O - https://nightly.odoo.com/odoo.key | sudo gpg --dearmor -o /usr/share/keyrings/odoo-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/odoo-archive-keyring.gpg] https://nightly.odoo.com/17.0/nightly/deb/ ./' | sudo tee /etc/apt/sources.list.d/odoo.list

#Instalacion de odoo
sudo apt-get update && sudo apt-get install odoo -y

#Descomentar la siguiente linea para crear automaticamente una base de datos con nombre de usuario y contraseña "admin"
#sudo -u odoo odoo -d db -i base,sale_management -c /etc/odoo/odoo.conf --language=es_ES
