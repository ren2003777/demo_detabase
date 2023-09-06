FROM maven:3-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -Dmaven.test.skip=true
FROM eclipse-temurin:17-alpine
COPY --from=build /target/demo_detabase-0.0.1-SNAPSHOT.jar demo_detabase.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo_detabase.jar"]