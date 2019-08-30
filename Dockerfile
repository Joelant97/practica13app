FROM openjdk:8

ADD build/libs/practica13app-0.0.1-SNAPSHOT.jar practica13app-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","practica13app-0.0.1-SNAPSHOT.jar"]