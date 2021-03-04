FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install \
    ruby-full build-essential cmake pkg-config \
    zlib1g-dev libicu-dev libssl-dev \
    && gem install bundler -N

WORKDIR /workspace

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD [ "bundle", "exec", "jekyll", "build" ]
