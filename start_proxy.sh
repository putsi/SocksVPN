#!/bin/bash

echo "Starting SSH server"
/usr/sbin/sshd -D &
sleep 5
echo "Starting OpenVPN tunnel"
openvpn credentials.ovpn &
sleep 5
ssh -p 22 -oStrictHostKeyChecking=no -N -D 0.0.0.0:8181 root@127.0.0.1
sleep 1
echo "Quitting!"