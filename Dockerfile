FROM alpine:latest

MAINTAINER Kodai Kato

RUN apk add --update --no-cache --virtual=build-deps \
    alpine-sdk xz \
    && apk add --update --no-cache boost-dev \
    && wget -q http://lotus.kuee.kyoto-u.ac.jp/nl-resource/jumanpp/jumanpp-1.01.tar.xz \
    && tar Jxfv jumanpp-1.01.tar.xz \
    && cd jumanpp-1.01/ \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm jumanpp-1.01.tar.xz \
    && apk del build-deps

CMD ["jumanpp"]
