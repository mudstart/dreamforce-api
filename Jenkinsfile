#!Rails

pipeline {
   agent {
    // Use docker container
    docker {
      image 'ruby:2.5.0'
    }
  }
  stages {
    stage('Pre-build') {
      steps {
        fileExists 'Gemfile'
        fileExists 'Dockerfile'
      }
    }
    stage('Docker Run') {
      agent any
      steps {
        sh 'docker-compose up'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker-compose build -t mudstart/dreamforce-api:latest .'
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