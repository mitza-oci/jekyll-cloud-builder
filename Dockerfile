FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install \
    build-essential ruby-dev ruby-bundler libicu-dev \
    && gem install jekyll

WORKDIR /workspace

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD [ "bundle", "exec", "jekyll", "build" ]
