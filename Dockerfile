# Taken from https://hub.docker.com/_/httpd
FROM httpd:alpine3.17
COPY ./public-html/ /usr/local/apache2/htdocs/
