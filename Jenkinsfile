#!groovy

pipeline {
  agent none
 tools {
    jdk 'jdk-17'
  }
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.6.3'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    stage('SonarQube analysis') {
      steps {
        withSonarQubeEnv(credentialsId: 'sonarqube-secret', installationName: 'sonarqube-server') {
          withMaven(maven : 'mvn-3.6.3') {
            sh 'mvn sonar:sonar -Dsonar.dependencyCheck.jsonReportPath=target/dependency-check-report.json -Dsonar.dependencyCheck.xmlReportPath=target/dependency-check-report.xml -Dsonar.dependencyCheck.htmlReportPath=target/dependency-check-report.html -Dsonar.java.pmd.reportPaths=target/pmd.xml -Dsonar.java.spotbugs.reportPaths=target/spotbugsXml.xml -Dsonar.zaproxy.reportPath=target/zap-reports/zapReport.xml -Dsonar.zaproxy.htmlReportPath=target/zap-reports/zapReport.html'
          }
        }
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t grupo06/spring-petclinic:latest .'
      }
    }
  }
}
