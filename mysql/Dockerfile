FROM mysql:5.7

ADD my.cnf /etc/mysql/my.cnf
ADD conf.d/* /etc/mysql/conf.d/

RUN usermod -u 1001 mysql

RUN mkdir -p /var/log/mysql
RUN mkdir -p /usr/local/mysql

# Write Permission
RUN chown -R mysql.mysql /var/run/mysqld
RUN chown -R mysql.mysql /var/lib/mysql
RUN chown -R mysql.mysql /usr/local/mysql
RUN chown -R mysql.mysql /usr/share/mysql
RUN chown -R mysql.mysql /tmp
RUN chown -R mysql.mysql /var/log/mysql
RUN chown -R mysql.mysql /usr/share/zoneinfo/

#EXPOSE 12306
USER mysql