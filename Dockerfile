FROM ubuntu:16.04

RUN apt-get update
RUN apt install -y openvpn openssh-server sshpass

ADD auth.txt /
ADD credentials.ovpn /
ADD ./start_proxy.sh /
RUN chmod +x /start_proxy.sh

RUN mkdir /var/run/sshd
RUN echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/start_proxy.sh"]
#CMD ["/bin/bash"]
