FROM lscr.io/linuxserver/wireguard:latest
COPY snell-server /usr/local/bin/
CMD /usr/local/bin/snell-server -c /config/snell-server.conf
