#FROM tomcat:8.0.20-jre8
# Dummy text to test 
# fix url web-hook
# fixed email for now
FROM tomcat:latest
COPY target/*.war /usr/local/tomcat/webapps/maven-web-application.war
