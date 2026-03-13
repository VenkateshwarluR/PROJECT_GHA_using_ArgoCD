FROM maven as buildstage
RUN /opt/webapp
WORKDIR /opt/webapp
COPY . .
RUN mvn clean install

FROM tomcat
WORKDIR webapps
COPY from=buildstage /opt/webapp/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
