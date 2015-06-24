# Dockerfile pour le point d'entrée applciatif des requêtes HTTP

FROM debian:wheezy
MAINTAINER Maxime Raynal <me@maxproject.fr>

RUN echo 'Acquire::http::Proxy "http://maxime:Rftgyh15@srv-200-isa:8080";' >> /etc/apt/apt.conf

ENV HTTP_PROXY="http://maxime.raynal:Rftgyh15@srv-200-isa:8080"
ENV HTTPS_PROXY="http://maxime.raynal:Rftgyh15@srv-200-isa:8080"
# Install de Nginx
RUN apt-get update \
    && apt-get install -y --force-yes --fix-missing \
       nginx

# Ajout des fichiers de confs
ADD nginx.conf /etc/nginx/
ADD mime.types /etc/nginx/
ADD uwsgi_param /etc/nginx/

# Ajout des fichiers de sites
RUN rm /etc/nginx/sites-enabled/default
ADD sites/uwsgi-application.conf /etc/nginx/sites-enabled/

# Externalisation du dossier de log
VOLUME ["/var/log/nginx"]

EXPOSE 80 443

CMD /etc/init.d/nginx start
