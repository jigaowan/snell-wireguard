FROM lscr.io/linuxserver/wireguard:latest
COPY snell-server /usr/local/bin/
COPY run.sh /usr/local/bin
CMD /usr/local/bin/run.sh
