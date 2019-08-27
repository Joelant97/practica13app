FROM openjdk:8

ADD build/libs/practica13-0.0.1-SNAPSHOT.jar practica13-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","practica13-0.0.1-SNAPSHOT.jar"]