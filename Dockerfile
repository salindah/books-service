# Use Eclipse Temurin OpenJDK 21 image (replace with your preferred provider)
FROM eclipse-temurin:21-jdk AS builder

# Set working directory for the build process
WORKDIR /app

# Install Maven during the build stage
RUN apt-get update && apt-get install -y maven

# Copy the pom.xml file
COPY pom.xml .
COPY src ./src

# Install dependencies (use --offline to avoid downloading during build)
RUN mvn clean install -DskipTests=true

# Create a new image based on a smaller Java runtime image
FROM eclipse-temurin:21-jdk

# Copy the application JAR from the build stage
COPY --from=builder /app/target/*.jar app.jar

# Set the working directory for the application
WORKDIR /app

# Expose the port where your Spring Boot application listens (typically 8080)
EXPOSE 8082

# Command to run the application JAR
CMD ["java", "-jar", "app.jar"]
