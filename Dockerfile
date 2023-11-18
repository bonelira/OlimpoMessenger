FROM openjdk:17-jdk-slim

WORKDIR /OlimpoMessenger

COPY OlimpoMessenger/target/messenger-0.0.1-SNAPSHOT.jar /app/app.jar
COPY src/main/resources/application.properties /app/application.properties

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
