FROM ubuntu:14.04
MAINTAINER Julian Labuschagne "personxx@gmail.com"
ENV REFRESHED_AT 2015-10-14
ENV TERM linux


RUN apt-get -y -q update && apt-get -y -q upgrade 

RUN apt-get -y -q install apache2 php5 php5-cli php5-gd php5-mysql php-pear 
RUN apt-get -y -q install sudo rsync git-core unzip curl 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install postfix
RUN apt-get -y -q install supervisor

RUN a2enmod rewrite

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME /var/www
VOLUME /etc/apache2/sites-enabled

EXPOSE 80
CMD ["/usr/bin/supervisord"]
