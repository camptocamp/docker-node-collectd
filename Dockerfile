FROM camptocamp/collectd:v0.3.1

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get -y --no-install-suggests --no-install-recommends install \
    libudev1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ADD ./collectd.run /etc/service/collectd/run

RUN echo "/usr/src/rootfs_prefix/rootfs_prefix.so" > /etc/service/collectd/env/LD_PRELOAD

COPY /config/*.conf /etc/collectd/collectd.conf.d/
