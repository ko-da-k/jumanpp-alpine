FROM alpine:latest

MAINTAINER K.Kato

ENV LANG=C.UTF-8 \
    JUMANPP_VERSION=1.02

RUN apk add --update --no-cache --virtual=build-deps \
    boost-dev g++ make \
    && wget -q http://lotus.kuee.kyoto-u.ac.jp/nl-resource/jumanpp/jumanpp-$JUMANPP_VERSION.tar.xz \
    && tar Jxfv jumanpp-$JUMANPP_VERSION.tar.xz \
    && cd jumanpp-$JUMANPP_VERSION/ \
    && ./configure \
    && make \
    && make install \
    && make clean \
    && cd .. \
    && rm jumanpp-$JUMANPP_VERSION.tar.xz \
    && rm -rf jumanpp-$JUMANPP_VERSION \
    && rm -rf /var/cache/* \
    && apk del build-deps \
    && apk add --update --no-cache boost 

CMD ["jumanpp"]
