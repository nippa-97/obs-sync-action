FROM ubuntu:20.04

LABEL maintainer="Nipun Sandeep <nipunsandeep97@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y \
    wget \
    tar \
    ca-certificates \
    && apt-get clean

WORKDIR /workspace

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
