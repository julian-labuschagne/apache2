FROM debian:latest
MAINTAINER Julian Labuschagne "julian.labuschagne@gmail.com"
ENV REFRESHED_AT 2016-04-12
ENV TERM linux

RUN apt-get -y -q update && apt-get -y -q upgrade 
RUN apt-get -y -q install apache2 php5 php5-cli php5-gd php5-mysql php5-curl php-pear sudo rsync git-core unzip curl supervisor

RUN a2enmod rewrite

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME /var/www/drupal
VOLUME /etc/apache2/sites-enabled

EXPOSE 80
CMD ["/usr/bin/supervisord"]
