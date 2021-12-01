FROM python:alpine

ADD ./scripts/docker-entrypoint.sh /docker-entrypoint.sh

RUN apk update &&\
  apk add --update curl &&\
  curl https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/v3.9.10/deps/rabbitmq_management/bin/rabbitmqadmin -o /usr/bin/rabbitmqadmin &&\
  chmod +x /usr/bin/rabbitmqadmin &&\
  chmod +x /docker-entrypoint.sh

# possible environment variables with defaults
ENV RABBIT_HOST=127.0.0.1 \
  RABBIT_PORT=15672 \
  RABBIT_USER=guest \
  RABBIT_PASSWORD=guest \
  RABBIT_VHOST=/

ENTRYPOINT ["/docker-entrypoint.sh"]
