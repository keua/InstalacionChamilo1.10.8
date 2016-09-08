# Instalación de chamilo lms 1.10.8 en Debian 8.0 (Jessie) utilizando apache2

ver la version de debian **lsb_release -a**

## Prerrequisitos

1. Instalar los siguientes paquetes
    * ``` sudo apt-get install libapache2-mod-php5 mysql-server php5-gd php5-intl php5-curl php5-json ```
2. Descargar chamilo 1.10.8 desde pagina oficial [Descargar](https://chamilo.org/es/chamilo-lms/#descargas)
3. Descomprimir chamilo en la carpeta **/var/www/html**
4. Agregar al archivo **/etc/apache2/apache2.conf** las siguientes lineas
    * ```
        <Directory /var/www/html/chamilo-lms-1.10.8>
                RewriteEngine On
                RewriteCond %{QUERY_STRING} ^id=(.*)$
                RewriteRule ^([^/.]+)/?$ user.php?$1 [L]
                RewriteRule ^certificates/$ certificates/index.php?id=%1 [L]
                RewriteRule ^courses/([^/]+)/$ app/course_home/course_home.php?cDir=$1 $
                RewriteRule ^courses/([^/]+)/index.php$ main/course_home/course_home.ph$
                RewriteRule ^courses/([^/]+)/document/(.*)$ main/document/download.php?$
                RewriteRule ^courses/([^/]+)/work/(.*)$ main/work/download.php?file=wor$
                RewriteRule ^courses/([^/]+)/upload/(.*)$ main/courses/$1/upload/$2 [QS$
                RewriteRule ^courses/([^/]+)/course-pic85x85.png$ main/courses/$1/cours$
                RewriteRule ^courses/([^/]+)/course-pic.png$ app/courses/$1/course-pic.$
                RewriteRule ^session/(\d{1,})/about/?$ main/session/about.php?session_i$
                RewriteRule ^badge/(\d{1,})/user/(\d{1,}) main/badge/issued.php?skill=$1&us$
        </Directory> 
      ```
5. Dar los permisos de lectura, escritura y ejecución a las siguientes carpetas **remplace [chamilo] por el directorio en el cual está ubicado su Chamilo**.
    * [chamilo]/app/
    * [chamilo]/vendor/ (solo en lectura y ejecución)
    * [chamilo]/web/
    * [chamilo]/main/default_course_document/images/
    * [chamilo]/main/lang/
6. Configurar archivo php **/etc/php5/apache2/php.ini**
    * max_execution_time = 300 ;Tiempo máximo de ejecucion para cada script, en segundos
    * max_input_time = 600 ;Tiempo máximo que cada script que puede emplear para analizar los datos solicitados
    * memory_limit = 256M ;Maxima cantidad de memoria que un script puede consumir (128MB)
    * post_max_size = 100M
    * upload_max_filesize = 100M;
    * short_open_tag = Off
    * safe_mode = Off
    * magic_quotes_gpc = Off
    * magic_quotes_runtime = Off
    * date.timezone = 'America/Guatemala'