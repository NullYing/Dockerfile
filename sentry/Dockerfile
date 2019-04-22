FROM sentry:9.1

WORKDIR /usr/src/sentry

# Add WORKDIR to PYTHONPATH so local python files don't need to be installed
ENV PYTHONPATH /usr/src/sentry

RUN sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list && sed -i "s/security.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list

RUN apt-get update && apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev

COPY requirements.txt /usr/src/sentry
COPY config.yml /usr/src/sentry
COPY sentry.conf.py /usr/src/sentry

# Hook for installing additional plugins
RUN if [ -s requirements.txt ]; then pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/; fi

# Hook for installing a local app as an addon
RUN if [ -s setup.py ]; then pip install -e .; fi

# Hook for staging in custom configs
RUN if [ -s sentry.conf.py ]; then cp sentry.conf.py $SENTRY_CONF/; fi \
	&& if [ -s config.yml ]; then cp config.yml $SENTRY_CONF/; fi

# 安装钉钉插件
RUN pip install git+git://github.com/NullYing/sentry-dingding@0.1.3
