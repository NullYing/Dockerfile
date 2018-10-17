FROM alpine:edge
MAINTAINER ourweijiang@gmail.com NullYing

RUN apk add --no-cache --upgrade apk-tools tzdata && \
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai" > /etc/timezone && \
apk del tzdata

EXPOSE 8000

RUN apk add --no-cache --update python2 python2-dev linux-headers musl musl-dev gcc py2-pip py2-lxml sqlite git libxml2-dev libxslt libxslt-dev;\
	pip install --upgrade pip && \
	pip install requests chardet web.py sqlalchemy gevent psutil ;

#克隆代理池源码
RUN git clone https://github.com/qiyeboy/IPProxyPool.git && \
        cd IPProxyPool && pip install -r requirements.txt

#启动代理池
CMD python /IPProxyPool/IPProxy.py
