echo "Stopping and removing existing proxy"
docker stop socksvpn
docker rm socksvpn
echo "Building socksvpnproxy"
docker build . -t socksvpn
echo ""
echo ""
echo "Starting socksvpnproxy"
docker run -d -P --name socksvpn --privileged socksvpn
echo ""
DPORT=$(docker port socksvpn 22 |cut -d':' -f2)
echo "Docker socksvpn ssh running on port $DPORT"
echo "Creating local socks proxy to 127.0.0.1:8181"
echo ""
sshpass -proot ssh -p $DPORT -oStrictHostKeyChecking=no -N -D8181 root@127.0.0.1
