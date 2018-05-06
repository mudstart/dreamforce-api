#!Rails

pipeline {
  agent any
  stages {
    stage('Pre-build') {
      steps {
        fileExists 'Gemfile'
        fileExists 'Dockerfile'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t mudstart/dreamforce-api:latest .'
      }
    }
  stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push mudstart/dreamforce-api:latest'
        }
      }
    }
  }
}