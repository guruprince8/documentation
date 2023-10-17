# Comment
# Comment
#RUN echo 'we are running some # of cool things'
#FROM eclipse-temurin:17-jdk-alpine
FROM openjdk:17
#VOLUME /tmp
#ARG JAR_FILE
#COPY ${JAR_FILE} app.jar
#WORKDIR /app
COPY cache-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
