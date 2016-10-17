FROM debian:latest
MAINTAINER Julian Labuschagne "julian.labuschagne@gmail.com"
ENV REFRESHED_AT 2016-10-17
ENV TERM linux

RUN apt-get -y -q update && \
  apt-get -y -q upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get -y -q install apache2 php5 php5-cli php5-gd php5-mysql php5-curl php-pear sudo rsync git-core unzip curl postfix supervisor

RUN a2enmod rewrite

COPY conf/postfix/* /etc/postfix/
COPY conf/php5/php.ini /etc/php5/apache2/php.ini
COPY conf/supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chmod 600 /etc/postfix/sasl_passwd && \
  postmap /etc/postfix/sasl_passwd


VOLUME /var/www/drupal
VOLUME /etc/apache2/sites-enabled

EXPOSE 80
CMD ["/usr/bin/supervisord"]
