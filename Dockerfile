FROM centos:7

RUN yum -y install httpd && yum clean all -y

RUN sed -i -e 's/^Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf


RUN echo "TEST ME v3" > /var/www/html/index.html

ENV MYVAR=marvin

VOLUME /var/www/html

EXPOSE 8080



CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

















