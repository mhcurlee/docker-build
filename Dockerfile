FROM centos:7

RUN yum -y install httpd

RUN sed -i -e 's/^Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf

RUN chown -R apache /var/log/httpd ; chown -R apache /var/run/httpd
RUN chmod -R o+rwX /var/log/httpd 
RUN chmod -R o+rwX /run/httpd/* 
RUN rm -f /run/httpd/httpd.pid 

RUN echo "TEST ME v3" > /var/www/html/index.html

ENV MYVAR=marvin

VOLUME /var/www/html

EXPOSE 8080

USER apache


CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

















