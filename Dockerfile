FROM ubuntu:latest
LABEL Author="hammer182"
LABEL Project="Portfolio"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install apache2 -y
CMD [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
EXPOSE 80
WORKDIR /var/www/html
VOLUME /var/log/apache2
ADD portfolio.tar.gz /var/www/html/