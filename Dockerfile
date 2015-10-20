FROM ubuntu:14.04
MAINTAINER Julian Labuschagne "personxx@gmail.com"
ENV REFRESHED_AT 2015-10-14

VOLUME /var/www
VOLUME /etc/apache2/sites-enabled

RUN apt-get -y -q update && apt-get -y -q upgrade 
RUN apt-get -y -q install apache2 php5 php5-cli php5-gd php5-mysql php-pear 
RUN apt-get -y -q install postfix sudo rsync git-core unzip curl 
RUN apt-get -y -q install supervisor

RUN a2enmod rewrite
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN adduser --system --group --home /var/www/webdev webdev && adduser webdev www-data

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
CMD ["/usr/bin/supervisord"]
