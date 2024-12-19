FROM maven:3-openjdk-17-alpine as builder

WORKDIR /usr/src/main

COPY . /usr/src/main
RUN mvn package

FROM openjdk:17-jre-alpine

COPY --from=builder /target/*.war /app.war

EXPOSE 8080

ENTRYPOINT ["java"]
CMD ["-war", "/app.war"]
