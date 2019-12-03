FROM debian:jessie

RUN apt-get update; apt-get -y upgrade; \ 
    apt-get install -y pptpd; \
    rm -rf /var/lib/apt/lists/*

RUN echo "localip 192.168.150.1" >> /etc/pptpd.conf; \
    echo "remoteip 192.168.150.100-200" >> /etc/pptpd.conf; \
    echo "ms-dns 8.8.8.8" >> /etc/ppp/pptpd-options; \
    mkdir /routes

EXPOSE 1723

COPY files/ns-start /usr/bin/
RUN chmod +x /usr/bin/ns-start


ENTRYPOINT [ "/usr/bin/ns-start" ]