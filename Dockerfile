FROM debian:jessie
MAINTAINER David Personette <dperson@gmail.com>

# Install transmission
RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends transmission-daemon curl \
                $(apt-get -s dist-upgrade|awk '/^Inst.*ecurity/ {print $2}') &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

COPY transmission.sh /usr/bin/

EXPOSE 9091 51413/tcp 51413/udp

ENTRYPOINT ["transmission.sh"]
