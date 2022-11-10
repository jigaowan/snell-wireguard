## config files

```
config_dir/
	wg0.conf
	snell-server.conf
```

`wg0.conf` is wireguard conf file

wg0.conf add sone rule

```
PostUp = ip rule add table 200 from [in docker ip]
PostUp = ip route add table 200 default via [in docker route]
PreDown = ip rule delete table 200 from [in docker ip]
PreDown = ip route delete table 200 default via [in docker route]
```

`snell-server.conf` is snell conf file

```
[snell-server]
listen = ::0:[port]
psk = [key]
ipv6 = true
```

## docker run

```
sudo docker run -d \
  --name=snell-wireguard \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --user 1000:1000 \
  -p {snell-port}:{snell-port} \
  -p 51820:51820/udp \
  -v {config dir}:/config \
  -v /lib/modules:/lib/modules \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --sysctl="net.ipv6.conf.all.disable_ipv6=0" \
  --restart always \
  ghcr.io/jigaowan/snell-wireguard:main
```

## TODO

find better way let snell run after wireguard finish