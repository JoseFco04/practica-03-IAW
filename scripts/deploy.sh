#!/bin/bash

#Muestra todos los comandos que se van ejecutando  
set -x

#Actualizamos los repositorios 
apt  update 

# Actualizamos todos los paquetes 
#apt upgrade -y 

# Eliminamos descargas previas del repositorio 
rm -rf /tmp/iaw-practica-lamp

# Clonamos el repositorio con el codigo fuente de la aplicacion
git clone https://github.com/josejuansanchez/iaw-practica-lamp /tmp/iaw-practica-lamp

# Movemos el codigo fuente de la aplicaciona /var/www/html
