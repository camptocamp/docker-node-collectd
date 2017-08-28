FROM camptocamp/collectd:v0.3.0

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get -y --no-install-suggests --no-install-recommends install \
    libudev1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ADD ./conf.d /etc/confd/conf.d
ADD ./templates /etc/confd/templates
ADD ./confd.run /etc/service/confd/run
ADD ./collectd.run /etc/service/collectd/run

RUN echo "/usr/src/rootfs_prefix/rootfs_prefix.so" > /etc/service/collectd/env/LD_PRELOAD

COPY /config/*.conf /etc/collectd/collectd.conf.d/
