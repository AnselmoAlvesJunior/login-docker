# Etapa 1: Construir o JAR
FROM maven:3.8.7-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa 2: Executar a aplicação
FROM amazoncorretto:17
WORKDIR /app
COPY --from=build /app/target/*.jar application.jar
ENTRYPOINT ["java", "-jar", "application.jar"]

