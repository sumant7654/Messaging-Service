FROM ubuntu:latest
FROM openjdk:21

EXPOSE 8083

ADD target/messaging-service*.jar messaging-service.jar

ENTRYPOINT ["java", "-jar", "/messaging-service.jar"]