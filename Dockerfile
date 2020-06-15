FROM mongo
RUN mkdir -p /data/db
VOLUME ["/data/db"]
WORKDIR /data
ENTRYPOINT mongod -d "app"
EXPOSE 27017
EXPOSE 28017

FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY build/libs/*.jar app.jar
ENTRYPOINT java -jar /app.jar