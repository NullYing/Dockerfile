FROM golang:1.12.4-alpine3.9 as builder

LABEL maintainer="NullYing <ourweijiang@gmail.com>"

ENV GEOIP_UPDATE_VERSION  4.0.2
ENV SRC_DL_URL_PREF       https://github.com/maxmind/geoipupdate/archive
ENV SRC_PATH              /go/src/github.com/maxmind/geoipupdate

RUN mkdir -p /go/src/github.com/maxmind/
RUN apk add --update --no-cache curl gcc make libc-dev perl
RUN curl -L "${SRC_DL_URL_PREF}/v${GEOIP_UPDATE_VERSION}.tar.gz" | tar -zxC /go/src/github.com/maxmind/
RUN mv "${SRC_PATH}-${GEOIP_UPDATE_VERSION}" /go/src/github.com/maxmind/geoipupdate
RUN cd "${SRC_PATH}"; make build/geoipupdate

FROM alpine:latest

ENV GEOIP_UPDATE_VERSION  4.0.2
ENV GEOIP_CONF_FILE /etc/GeoIP.conf

RUN apk add --update --no-cache curl
RUN curl -L "https://github.com/maxmind/geoipupdate/releases/download/v${GEOIP_UPDATE_VERSION}/geoipupdate_${GEOIP_UPDATE_VERSION}_linux_amd64.tar.gz" | tar -zxC /tmp
COPY --from=builder /go/src/github.com/maxmind/geoipupdate/build/geoipupdate /usr/bin
RUN mv /tmp/geoipupdate_${GEOIP_UPDATE_VERSION}_linux_amd64/GeoIP.conf /etc && \
    rm -R /tmp/geoipupdate_${GEOIP_UPDATE_VERSION}_linux_amd64 && \
    chown -R root:root /usr/bin/geoipupdate && \
    chmod -R 777 /usr/bin/geoipupdate && \
    mkdir /usr/local/share/GeoIP

CMD geoipupdate -f ${GEOIP_CONF_FILE} -v
