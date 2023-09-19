FROM redis:5.0.13

RUN usermod -u 1002 redis

#Set permissions
RUN touch /var/run/redis.pid && mkdir -p /var/lib/redis
RUN chown -R redis.redis /var/run/redis.pid /var/lib/redis


#EXPOSE 12379
USER redis

COPY redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]