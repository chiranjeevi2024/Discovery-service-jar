FROM maven:3.8.4-jdk-8-slim as maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn clean install -DskipTests=true
FROM openjdk:8u171-jre-alpine
WORKDIR /app
COPY --from=maven target/descovery-server-0.0.1-SNAPSHOT.jar  ./descovery-server-0.0.1-SNAPSHOT.jar
EXPOSE 8761
ENTRYPOINT ["java","-jar","descovery-server-0.0.1-SNAPSHOT.jar"]
