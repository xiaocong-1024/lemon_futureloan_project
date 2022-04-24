FROM mysql:5.7
LABEL maintainer="wangxiao"
LABEL version="1.0"
LABEL description="futureloan deploy"

#
WORKDIR /opt
ADD apache-tomcat-8.5.59.tar.gz .
ADD jdk-8u121-linux-x64.tar.gz .

#
ENV JAVA_HOME /opt/jdk1.8.0_121
ENV  CLASSPATH $JAVA_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin
ENV CATALINA_HOME /opt/apache-tomcat-8.5.59

COPY futureloan.war  /opt/apache-tomcat-8.5.59/webapps/
COPY futureloan.sql /opt/
COPY setup.sh /opt/

ENTRYPOINT ["/bin/bash", "/opt/setup.sh"]
