node('Docker') {
          stage('Setup') {
            checkout scm
            sh '''./docker-up.sh'''
          }
    

          // stage("Install Bundler") {
          //   sh "gem install bundler --no-rdoc --no-ri"
          // }

          // stage("Use Bundler to install dependencies") {
          //   sh "bundle install"
          // }

          // stage("Build package") {
          //   sh "bundle exec rake build:deb"
          // }

          // stage("Archive package") {
          //   archive (includes: 'pkg/*.deb')
          // }

        
        // Clean up workspace
        step([$class: 'WsCleanup'])
}