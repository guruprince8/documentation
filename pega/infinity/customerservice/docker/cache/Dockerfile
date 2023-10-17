# Comment
# Comment
#RUN echo 'we are running some # of cool things'
FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT {"java","-jar","/app.jar"]
