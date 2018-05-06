Jenkinsfile(Declarative Pipeline)
pipeline {
   agent {
         docker { image 'ruby:2.5.0'}      
   }

stages {
    stage('Test'){
        steps {
             sh 'ruby -v'
           }
        }
     }
   }