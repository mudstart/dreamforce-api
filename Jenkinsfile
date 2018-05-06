#!groovy

pipeline {
  agent none
  stages {
    stage('Ruby Install') {
      agent {
        docker {
          image 'ruby:2.5.1'
        }
      }
      steps {
        sh 'gem install rails'
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