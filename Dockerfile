FROM ubuntu:18.04
ENV TZ=Europe/Belgrade

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y supervisor nodejs npm bind9 bind9utils bind9-doc
RUN mkdir -p /var/www/nodeapp80/ && mkdir -p /var/www/nodeapp4000/ && mkdir -p /var/www/nodeapp5000/ 
COPY node/node80 /var/www/nodeapp80/ 
COPY node/node443 /var/www/nodeapp443/ 
COPY node/node4000 /var/www/nodeapp4000/
COPY node/node5000 /var/www/nodeapp5000/

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 80 443 4000 5000 53/tcp 53/udp
CMD ["/usr/bin/supervisord"]