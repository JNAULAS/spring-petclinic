FROM anapsix/alpine-java 
LABEL maintainer="juangns_sudamericano@yahoo.es" 
COPY /target/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar /home/spring-petclinic-2.3.0.jar 
CMD ["java","-jar","/home/spring-petclinic-2.3.0.jar"]
