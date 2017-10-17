FROM centos:7


#install apache
RUN yum -y install httpd && yum clean all -y \
sed -i -e 's/^Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf \
chmod -R g=u /run/httpd  \
chmod -R g=u /var/log/httpd 


#add custom start script
COPY start_apache.sh /usr/bin/start_apache.sh
RUN chmod +x  /usr/bin/start_apache.sh


RUN echo "TEST ME v4" > /var/www/html/index.html

ENV MYVAR=marvin

VOLUME /var/www/html

EXPOSE 8080

USER apache

CMD ["/usr/bin/start_apache.sh"]

















