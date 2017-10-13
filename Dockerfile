FROM centos:7

RUN yum -y install httpd

RUN sed -i -e 's/^Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf

RUN chgrp -R 0 /var/log/httpd ; chgrp -R 0 /var/run/httpd
RUN chmod -R g=u var/log/httpd 
RUN chmod -R g=u /run/httpd/* 

RUN echo "TEST ME v3" > /var/www/html/index.html

ENV MYVAR=marvin

VOLUME /var/www/html

EXPOSE 8080

USER apache


CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

















