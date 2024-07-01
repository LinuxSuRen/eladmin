FROM maven:3.9.8-amazoncorretto-8 as builder
WORKDIR /workspace
COPY . .
RUN mvn install -DskipTests=true

FROM openjdk
WORKDIR /workspace
COPY --from=builder /workspace/eladmin-system/target/eladmin-system-2.7.jar .

CMD ["java", "-jar", "/workspace/eladmin-system-2.7.jar"]
