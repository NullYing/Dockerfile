FROM lsiobase/alpine.armhf:latest

LABEL maintainer="ourweijiang@gmail.com"

RUN /bin/apk update
RUN /bin/apk add bash

RUN mkdir -p /conf && \
    mkdir -p /conf-copy && \
    mkdir -p /data && \
    /bin/apk add aria2

ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf
ADD files/on-complete.sh /conf-copy/on-complete.sh

RUN chmod +x /conf-copy/start.sh

WORKDIR /
VOLUME ["/data"]
VOLUME ["/conf"]
EXPOSE 6800

CMD ["/conf-copy/start.sh"]
