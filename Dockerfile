FROM registry.access.redhat.com/ubi8:latest

USER 0

MAINTAINER Stephen Butler stephen.butler@verdi.de

RUN dnf makecache --disableplugin=subscription-manager && \
	dnf install -y --disableplugin=subscription-manager httpd && \
	dnf clean all && \
	sed -i 's/Listen 80/Listen 8080/; /^ErrorLog/d; /CustomLog/d' /etc/httpd/conf/httpd.conf

COPY index.html /var/www/html/index.html
COPY container.conf /etc/httpd/conf.d/container.conf

EXPOSE 8080

USER 1001

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

