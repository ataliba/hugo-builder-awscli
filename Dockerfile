FROM alpine:latest

LABEL authors="Ataliba Teixeira <ataliba@protonmail.com,Christophe de Vienne <christophe.devienne@orus.io>"

MAINTAINER Christophe de Vienne <christophe.devienne@orus.io>

# Version of Hugo 
ENV VERSION 0.69.2
####

RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip 


RUN apk add --no-cache git openssl py-pygments curl \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/bin/hugo \
    && apk del curl

