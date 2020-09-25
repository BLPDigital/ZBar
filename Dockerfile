FROM python:3.8

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y libtool autoconf gettext cpp shtool \
    autogen libmagick++-6.q16-dev make autopoint

COPY . /src/zbar
WORKDIR /src/zbar
RUN autoreconf -vfi
RUN ./configure --disable-dependency-tracking --disable-video --without-gtk --without-java --without-qt --without-python
RUN make
