FROM centos:7

RUN yum -y install httpd && yum clean all -y
RUN sed -i -e 's/^Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf
 
RUN chmod -R g+rwx /run/httpd && chgrp -R 0 /run/httpd
RUN chmod -R g+rwX /var/log/httpd && chgrp -R 0 /var/log/httpd



ADD start_apache.sh /usr/bin/start_apache.sh
RUN chmod +x  /usr/bin/start_apache.sh

RUN echo "TEST ME v3" > /var/www/html/index.html

ENV MYVAR=marvin

VOLUME /var/www/html

EXPOSE 8080


CMD ["/usr/bin/start_apache.sh"]

















