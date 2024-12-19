FROM maven:3-jdk-17-alpine as builder

WORKDIR /usr/src/app

COPY . /usr/src/app
RUN mvn package

FROM openjdk:17-jre-alpine

COPY --from=builder /usr/src/app/target/*.war /app.war

EXPOSE 8080

ENTRYPOINT ["java"]
CMD ["-war", "/app.war"]
