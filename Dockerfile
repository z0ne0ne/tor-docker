FROM alpine:latest
LABEL maintainer="z0ne0ne@protonmail.com" description="tor service with nyx in a docker container"

RUN apk add --no-cache tor \
    python3 \
    python3-dev \
    py-pip \
    build-base
RUN pip install nyx    

EXPOSE 9001
EXPOSE 9030
EXPOSE 9050
EXPOSE 9051

COPY torrc.default /etc/tor/torrc
VOLUME ["/var/lib/tor"]
USER tor
CMD ["/usr/bin/tor"]
