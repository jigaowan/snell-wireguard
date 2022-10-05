## config files

```
config_dir/
	wg0.conf
	snell-server.conf
```

`wg0.conf` is wireguard conf file

`snell-server.conf` is snell conf file

```
[snell-server]
listen = ::0:[port]
psk = [key]
ipv6 = True
obfs = tls
```

## podman run

```
podman run -d \
  --name=snell-wireguard \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --user 1000:1000 \
  -p {snell-port}:{snell-port} \
  -p 51820:51820/udp \
  -v {config dir}:/config \
  -v /lib/modules:/lib/modules \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --restart always \
  ghcr.io/jigaowan/snell-wireguard:main
```

