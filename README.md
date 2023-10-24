# practica-03-IAW
### Para esta práctica vamos a crear una instancia de ubuntu, pulsamos en lanzar instancia y seleccionamos ubuntu 
![cap 1 p3](https://github.com/JoseFco04/practica-03-IAW/assets/145347148/37b6124d-4994-4a13-b8d9-1ba57372f835)

### Le ponemos de tamaño small la máquina.
![cap 2 p3](https://github.com/JoseFco04/practica-03-IAW/assets/145347148/41e28934-8db1-495c-b49a-b377cfeec1bc)

### Le permitimos el tráfico http y https para que nos añada los puertos de seguridad directamente 
![cap 3 p3](https://github.com/JoseFco04/practica-03-IAW/assets/145347148/17ae3a20-aa69-4628-b792-f101c0fc4a08)

### Después de esto le asignamos una ip pública o ip elástica y empezamos con los scripts.

### Tenemos tres scripts que vamos a copiar de la práctica uno: es script del install_lamp, el de configuracion y el de php.

### El script del lamp es este paso por paso :

#### Muestra todos los comandos que se van ejecutando
~~~
set -x
~~~
#### Actualizamos los repositorios
~~~
apt update
~~~
#### Actualizamos los paquetes
~~~
#### apt upgrade -y
~~~
#### instalamos el servidor web Apache
~~~
apt install apache2 -y
~~~
#### Instalamos e sistema gestor de base de datos de mysql
~~~
apt install mysql-server -y
~~~
#### mysql -u $DB_USER -p $DP_PASSWD < .../sql/database.sql

#### Instalamos  PHP
~~~
apt install php libapache2-mod-php php-mysql -y
~~~
#### Copiar el archivo de configuración de Apache 
~~~
cp ../conf/000-default.conf /etc/apache2/sites-available
~~~
#### Reiniciamos el servicio Apache
~~~
systemctl restart apache2
~~~
#### Copiamos el archivo de prueba de php
~~~
cp ../php/index.php /var/www/html
~~~
#### Modificamos el propietario y el grupo del directorio /var/www/html
~~~
chown -R www-data:www-data /var/www/html
~~~
### El archivo de cofiguracion 000-default-conf es este:
~~~
ServerSignature Off
ServerTokens Prod

<VirtualHost *:80>
#ServerName www.example.com
DocumentRoot /var/www/html

  DirectoryIndex index.php index.html

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
~~~
### El archivo de php
~~~
<?php

phpinfo();

?>
~~~
### Después tenemos nuestro archivo .env para guardar nuestras variables
~~~
# Configuramos las variables
#-------------------------------------------
DB_NAME=aplicacion
DB_USER=usuario
DB_PASSWORD=password
~~~
### Y el ultimo es el script del deploy.sh que paso por paso hace esto:


