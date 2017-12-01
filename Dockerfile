FROM mariadb

ENV MYSQL_ROOT_PASSWORD=12345
ENV MYSQL_DATABASE=prestamos
# Se almacena el SQL en la carpeta que, la imagen de mariadb ejecuta por defecto y 
# dichos datos son volcados sobre la base de datos indicada en la variable de entorno MYSQL_DATABASE 
ADD /prestamosv3.sql /docker-entrypoint-initdb.d/prestamosv3sql.sql
EXPOSE 3306
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]

