# Step 1: Build Stage using Maven with JDK 17
FROM maven:3-openjdk-17 as builder

WORKDIR /usr/src/app

COPY . /usr/src/app

# Run mvn clean package to ensure clean build with JDK 17
RUN mvn clean package

# Step 2: Runtime St using OpenJDK 17 Alpine
FROM openjdk:17

# Copy the WAR file from the builder stage to the runtime stage
COPY --from=builder /usr/src/app/target/*.war /app.war

# Expose port 8080 for the application
EXPOSE 8080

# Set entry point and command to run the WAR file with Java
ENTRYPOINT ["java"]
CMD ["-jar", "/app.war"]
