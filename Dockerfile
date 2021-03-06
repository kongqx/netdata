# author  : titpetric
# original: https://github.com/titpetric/netdata

FROM debian:jessie

ADD docker-build.sh /docker-build.sh

RUN chmod +x /docker-build.sh && sync && sleep 1 && /docker-build.sh

WORKDIR /

ENV NETDATA_PORT 19999
EXPOSE $NETDATA_PORT

CMD /usr/sbin/netdata -D -s /host -p ${NETDATA_PORT}
