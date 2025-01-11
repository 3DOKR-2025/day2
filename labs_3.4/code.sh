docker pull wordpress:latest
docker pull mysql:9.1.0
docker network create wordpress-network # obligatoire afin que wordpress puisse accéder à la base de donnée
docker run --name mysql \
--network wordpress-network \
-e MYSQL_ROOT_PASSWORD=Sup1nf0 \
-e MYSQL_DATABASE=wordpressdb \
-p 3306:3306 \
-d mysql:9.1.0
docker run --name wordpress \
--network wordpress-network \
-e WORDPRESS_DB_HOST=mysql \
-e WORDPRESS_DB_USER=root \
-e WORDPRESS_DB_PASSWORD=Sup1nf0 \
-e WORDPRESS_DB_NAME=wordpressdb \
-p 8080:80 \
-d wordpress:latest
