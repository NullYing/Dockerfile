FROM redis:alpine
COPY redis.conf /usr/local/redis/etc/redis.conf

COPY entrypoint.sh /usr/local/redis/bin/entrypoint.sh
RUN chmod +x /usr/local/redis/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/redis/bin/entrypoint.sh"]

EXPOSE 6379

CMD ["redis-server /usr/local/redis/etc/redis.conf"]
