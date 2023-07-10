FROM tomcat:9.0-jdk11
LABEL maintainer="Erik Kitchen ekitche@gmu.edu"
COPY Student_Survey.war /usr/local/tomcat/webapps/


