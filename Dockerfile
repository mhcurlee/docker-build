FROM centos:6


RUN yum -y install httpd

RUN echo "TEST ME v2" > /var/www/html/index.html

EXPOSE 80

CMD /usr/sbin/httpd -D FOREGROUND


