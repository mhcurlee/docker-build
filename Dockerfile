FROM centos:7

RUN yum -y install httpd && yum clean all -y
RUN sed -i -e 's/^Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf

RUN chmod -R g+w /run/httpd/


ADD start_apache.sh /usr/bin/start_apache.sh
RUN chmod +x  /usr/bin/start_apache.sh

RUN echo "TEST ME v3" > /var/www/html/index.html

ENV MYVAR=marvin

VOLUME /var/www/html

EXPOSE 8080


CMD ["/usr/bin/start_apache.sh"]

















