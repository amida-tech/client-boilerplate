FROM nginx:stable
MAINTAINER Jacob Sachs "jacob@amida-tech.com"

RUN rm /etc/nginx/nginx.conf /etc/nginx/mime.types
COPY deploy/nginx.conf /etc/nginx/nginx.conf
COPY deploy/basic.conf /etc/nginx/basic.conf
COPY deploy/mime.types /etc/nginx/mime.types
RUN mkdir /etc/nginx/ssl
COPY deploy/default /etc/nginx/sites-enabled/default
COPY deploy/default-ssl /etc/nginx/sites-available/default-ssl
COPY deploy/directive-only /etc/nginx/directive-only
COPY deploy/location /etc/nginx/location

# add build client code
COPY build/ /var/www

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443

CMD ["nginx"]