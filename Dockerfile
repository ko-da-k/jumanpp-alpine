FROM alpine:latest

MAINTAINER K.Kato

ENV LANG=C.UTF-8

RUN apk add --update --no-cache --virtual=build-deps \
    boost-dev g++ make \
    && wget -q http://lotus.kuee.kyoto-u.ac.jp/nl-resource/jumanpp/jumanpp-1.01.tar.xz \
    && tar Jxfv jumanpp-1.01.tar.xz \
    && cd jumanpp-1.01/ \
    && ./configure \
    && make \
    && make install \
    && make clean \
    && cd .. \
    && rm jumanpp-1.01.tar.xz \
    && rm -rf jumanpp-1.01 \
    && rm -rf /var/cache/* \
    && apk del build-deps \
    && apk add --update --no-cache boost 

CMD ["jumanpp"]
