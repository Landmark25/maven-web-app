#FROM tomcat:8.0.20-jre8
# Dummy text to test 
# fix url web-hook
# fixed email for now
FROM docker pull tomcat:9.0.53-jdk17-corretto
COPY target/*.war /usr/local/tomcat/webapps/maven-web-application.war
