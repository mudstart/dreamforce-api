#!Rails

pipeline {
  agent any
  stages {
    stage('Pre-build') {
      steps {
        fileExists 'Gemfile'
        fileExists 'Dockerfile'
        sh 'docker info'
      }
      stage("Install dependencies") {
        sh "gem install bundler --no-rdoc --no-ri && bundle install"
      }
    }
    stage('Test') {
      steps {
        sh 'docker-compose run'
        sh 'docker run -d -p 3002:3000 mudstar/dreamforce-api'
      }
    }
    stage('Clean up') {
      steps {
        sh 'docker stop $(docker ps -q)'
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