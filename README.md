# SocksVPN

This docker image connects to given OpenVPN-server and creates socks5-proxy to local host machine port 8181. It is useful if you don't want to tunnel all device traffic through VPN but just couple apps.

## How does it work?

Internet <--> OpenVPN-Server <--> SocksVPN(OpenVPN Client <-- SSH-Server <-- SSH-Client <-- SOCKS-proxy) <--> Host-machine Socks-client

## How to use?

1. Place your OpenVPN-config file to directory root as credentials.ovpn.
2. (optional) Place your actual connection credentials to auth.txt-file.
3. Run ```sudo ./run.sh```
4. Configure proxy-settings of your applications to use 127.0.0.1:8181 as SOCKS5-proxy.
