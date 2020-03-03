FROM docker:stable-dind
RUN apk update
RUN apk add --no-cache openrc
RUN apk add --no-cache iptables
RUN apk add --no-cache openjdk11
RUN apk add --no-cache py-pip
RUN apk add --no-cache python-dev libffi-dev openssl-dev gcc libc-dev make
RUN pip install docker-compose

WORKDIR /usr/shared/crawler
COPY docker-compose.yaml ./docker-compose.yaml
COPY start.sh ./start.sh
RUN chmod +x ./start.sh
ENTRYPOINT ["./start.sh"]