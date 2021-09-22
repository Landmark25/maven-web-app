FROM tomcat:9.0.53-jdk11-corretto
COPY target/*.war /usr/local/tomcat/webapps/web-app.war

# FROM tomcat:8.0.20-jre8
# Dummy text to test test
# dummy gummy
# COPY target/*.war /usr/local/tomcat/webapps/maven-web-application.war
