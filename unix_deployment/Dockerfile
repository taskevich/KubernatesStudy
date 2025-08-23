FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    openssh-server sudo bash passwd openssl net-tools \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN useradd -u 1001 -m -s /bin/bash task \
    && echo "task ALL=(ALL) ALL" >> /etc/sudoers

RUN mkdir -p /var/run/sshd && \
    ssh-keygen -A

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22

CMD ["/entrypoint.sh"]
