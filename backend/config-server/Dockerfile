FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY backend/config-server/target/*.jar app.jar
COPY config-repo /app/config-repo
EXPOSE 8888
ENTRYPOINT ["java", "-jar", "app.jar"]
