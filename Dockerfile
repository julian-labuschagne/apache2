FROM ubuntu:14.04
MAINTAINER Julian Labuschagne "personxx@gmail.com"
ENV REFRESHED_AT 2015-10-14

RUN apt-get -y -q update && apt-get -y -q install apache2 php5 php5-cli php5-gd php5-mysql php-pear postfix sudo rsync git-core unzip supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
CMD ["/usr/bin/supervisord"]
