FROM gcc:11
RUN echo 'Acquire::http::Proxy "http://192.168.12.43:9999";' > /etc/apt/apt.conf.d/00aptproxy
RUN apt update
RUN apt install libc-ares-dev -y
WORKDIR /usr/src/myapp
RUN wget http://172.16.14.105:8081/repository/orca-raw/bzflag/bzflag-2.4.24.tar.gz
RUN tar xzvf bzflag-2.4.24.tar.gz
ADD ./plugins/ScoreRestorer /usr/src/myapp/bzflag-2.4.24/plugins/ScoreRestorer
RUN ls /usr/src/myapp/bzflag-2.4.24/plugins/
WORKDIR /usr/src/myapp/bzflag-2.4.24/
RUN ./autogen.sh
RUN ./configure --prefix /usr/local/bzflag/ --enable-custom-plugins=ScoreRestorer
RUN make
RUN make install
COPY ./config.conf /usr/local/bzflag/
COPY maps /usr/local/bzflag/maps
WORKDIR /usr/local/bzflag/
ENTRYPOINT ["/usr/local/bzflag/bin/bzfs", "-conf", "config.conf"]
