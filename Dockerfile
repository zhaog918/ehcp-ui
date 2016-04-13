FROM rancher/docker-dind-base:v0.4.1
RUN mkdir /source
RUN mkdir /root/.ssh;chmod 700 /root/.ssh
COPY ./id_rsa* /root/.ssh/
COPY ./known_hosts /root/.ssh/
RUN chmod 644 /root/.ssh/;chmod 600 /root/.ssh/id_rsa
WORKDIR /source
RUN cd /source
RUN git clone git@git.oschina.net:wangzih/emc-rancher-ui.git .
COPY ./i18n.txt /source/public/i18n.txt
RUN ./scripts/bootstrap
RUN ./scripts/update-dependencies
CMD RANCHER="http://ehcp-server:8080/" npm start
