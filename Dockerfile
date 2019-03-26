FROM alpine

RUN apk add --no-cache --update python py-pip curl jq \
    && pip install awscli \
    && rm -rf /var/cache/apk/*

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
