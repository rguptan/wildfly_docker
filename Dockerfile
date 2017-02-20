FROM jboss/wildfly:latest
RUN /opt/jboss/wildfly/bin/add-user.sh admin Welcome1 --silent

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

ADD TestWeb.war /opt/jboss/wildfly/standalone/deployments/

HEALTHCHECK CMD curl --fail http://localhost:8080/TestWeb/ || exit 1
