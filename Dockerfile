FROM ubuntu:20.04

RUN apt-get update
RUN apt install -y openvpn openssh-server sshpass

ADD auth.txt /
ADD credentials.ovpn /
ADD ./start_proxy.sh /
RUN chmod +x /start_proxy.sh

RUN mkdir -p /run/sshd /root/.ssh && ssh-keygen -A && ssh-keygen -f /root/.ssh/id_rsa && cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

CMD ["/start_proxy.sh"]
#CMD ["/bin/bash"]
