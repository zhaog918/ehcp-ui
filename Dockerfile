FROM rancher/docker-dind-base:v0.4.1
RUN mkdir /source
WORKDIR /source
RUN cd /source
RUN git merge https://git.oschina.net/wangzih/emc-rancher-ui.git .
RUN ./scripts/update-dependencies
CMD RANCHER="http://ehcp-server:8080/" npm start
