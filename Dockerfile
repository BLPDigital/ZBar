FROM python:3.8-slim

RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
    && apt-get install -y libtool \
    autoconf \
    gettext \
    cpp \
    shtool \
    autogen \
    libmagick++-6.q16-dev \
    make \
    autopoint

COPY . /src/zbar
WORKDIR /src/zbar
RUN autoreconf -vfi \
    && ./configure --disable-doc --disable-dependency-tracking --disable-video --without-gtk --without-java --without-qt --without-python \
    && make \
    && make install

WORKDIR /root
RUN rm -rf /scr/zbar

ENTRYPOINT [ "/bin/bash" ]
