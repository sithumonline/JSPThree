FROM tomcat:9.0.1-jre8-alpine

ADD ./target/JSPThree-1.0-SNAPSHOT /usr/local/tomcat/webapps/webapp

CMD ["catalina.sh", "run"]
