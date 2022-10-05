FROM lscr.io/linuxserver/wireguard:latest
COPY snell-server /usr/bin/
CMD /usr/bin/snell-server -c /config/snell-server.conf