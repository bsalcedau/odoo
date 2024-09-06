#!/bin/bash

sudo apt update && sudo apt install curl -y

#Descarga clave
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg

#Añadir clave al repositorio
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

#Instalacion de pgadmin en modo escritorio
sudo apt install pgadmin4-desktop -y

#Cambio de la contraseña del usuario postgres
sudo su - postgres <<EOF
psql <<EOF2
alter role postgres password 'abcd';
EOF2
EOF
