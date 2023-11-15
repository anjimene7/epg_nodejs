FROM node:18-alpine3.17

RUN apk update && \
    apk add --no-cache bash python3 py3-pip git

RUN adduser -D -s /bin/bash epgguide && \
    mkdir -p /opt/epgguide/epg && \
    chown -R epgguide /opt/epgguide

USER epgguide

ADD run.sh /opt/epgguide/

WORKDIR /opt/epgguide

RUN git clone --depth 1 -b master https://github.com/iptv-org/epg.git && \
    cd epg && \
    sed -i '/tsx":/s/3.13.0/4.1.1/g' package.json && \
    npm install

EXPOSE 3000

WORKDIR /opt/epgguide/epg

CMD ["/opt/epgguide/run.sh"]