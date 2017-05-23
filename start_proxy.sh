#!/bin/bash

echo "Starting SSH server"
/usr/sbin/sshd -D &
sleep 5
echo "Starting OpenVPN tunnel"
openvpn credentials.ovpn
echo "Quitting!"
