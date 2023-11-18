# Stage 1: Build the application
FROM maven:3.8.4-openjdk-17 AS build

WORKDIR /OlimpoMessenger

COPY . .

RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM openjdk:17-jdk-slim

WORKDIR /OlimpoMessenger

COPY --from=build /OlimpoMessenger/target/messenger-0.0.1-SNAPSHOT.jar app.jar


EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
