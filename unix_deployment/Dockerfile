FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    openssh-server sudo bash passwd openssl net-tools \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -u 1001 -m -s /bin/bash task \
    && echo "task:$(openssl passwd -6 fsociety)" | chpasswd -e \
    && echo "task ALL=(ALL) ALL" >> /etc/sudoers

RUN echo "root:$(openssl passwd -6 fsociety)" | chpasswd -e

RUN mkdir -p /var/run/sshd && \
    ssh-keygen -A

USER task
WORKDIR /home/task

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
