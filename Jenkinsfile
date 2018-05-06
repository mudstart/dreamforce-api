#!groovy

pipeline {
  agent none
  stages {
    stage('Test') {
      agent {
        node {
          label "ruby"
        }
      }
      stage("Install dependencies") {
        sh "gem install bundler --no-rdoc --no-ri && bundle install"
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