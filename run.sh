:<<BATCH
    @echo off
BATCH

echo "Stopping and removing existing proxy"
docker stop socksvpn
docker rm socksvpn
echo "Building socksvpnproxy"
docker build . -t socksvpn
echo ""
echo ""
echo "Starting socksvpnproxy"
docker run -d --rm -p 8181:8181 --name socksvpn --privileged socksvpn
echo ""
echo "Docker socksvpn socks running on port 8181"
echo "Stop with: docker stop socksvpn"