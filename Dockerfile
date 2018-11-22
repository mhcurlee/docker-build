FROM jsmigel/centos-epel
#FROM centos:7


#add custom start script
COPY start_apache.sh /usr/bin/start_apache.sh

#install apache
RUN yum -y install httpd stress && yum clean all -y && \
sed -i -e 's/^Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf && \
chgrp -R 0 /run/httpd && \
chmod -R g=rwX /run/httpd && \
chgrp -R 0 /var/log/httpd && \
chmod -R g=rwX /var/log/httpd  && \
echo "TEST ME v7" > /var/www/html/index.html && \
echo "<br><br><center><img src=ose.png></center>" >> /var/www/html/index.html && \
chmod +x  /usr/bin/start_apache.sh

#add png file 
COPY ose.png /var/www/html/ose.png

ENV MYVAR=marvin

EXPOSE 8080

USER apache

CMD ["/usr/bin/start_apache.sh"]

















