#!Rails

pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t dreamforce-api:lastest'
      }
    }
  }
}