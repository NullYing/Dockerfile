FROM jenkins/jenkins:lts

#安装jenkins插件
USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

USER root
ARG dockerGid=999

#将jenkins用户放docker组,安装gosu
RUN echo "docker:x:${dockerGid}:jenkins" >> /etc/group \ 
    && apt-get update &&  apt-get install -y gosu \
    && apt-get install -y libltdl7 \
    && rm -rf /var/lib/apt/list/*

ENV JENKINS_SLAVE_AGENT_PORT 50001
EXPOSE 8080

# ENV JENKINS_JAVA_OPTIONS="-Xmx500m"
ENV JAVA_OPTS="-Dorg.apache.commons.jelly.tags.fmt.timeZone=Asia/Shanghai -Duser.timezone=Asia/Shanghai -Xms1024m -Xmx1024m -XX:PermSize=512M -XX:PermSize=1024M"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
