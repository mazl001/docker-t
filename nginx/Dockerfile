FROM nginx:1.18.0

#Add user for nginx container
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

#Set permissions
RUN mkdir -p /www/htdocs && mkdir -p /www/log/nginx
RUN chown -R www.www /www/htdocs /www/log/nginx

RUN mkdir -p /var/cache/nginx
RUN chown -R www.www /var/cache/nginx /etc/nginx

RUN touch /run/nginx.pid
RUN chown -R www.www /run/nginx.pid

#Copy Config
COPY nginx.conf /etc/nginx/nginx.conf
COPY sites-enabled/* /etc/nginx/sites-enabled/


#Change current user to www
USER www