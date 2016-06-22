FROM camptocamp/collectd:0.1.0

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get -y --no-install-suggests --no-install-recommends install \
    libcurl3-gnutls \
    libgcrypt20 \
    libriemann-client0 \
    libudev1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY /config/*.conf /etc/collectd/collectd.conf.d/
