FROM ubuntu:latest
USER root
WORKDIR /root
RUN apt-get update 
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=${TZ}
RUN apt-get install -y tzdata
RUN apt-get -y install openssh-server \
nano \
supervisor \
php \
apache2 \
libapache2-mod-php7.4 -y

ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh
RUN echo "AuthorizedKeysFile .ssh/authorized_keys" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
RUN touch authorized_keys
RUN mkdir /keys
#RUN echo "\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

EXPOSE 22 80

CMD ["/usr/bin/supervisord"]

VOLUME ["/var/log/apache2"]
