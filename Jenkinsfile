#!Rails

pipeline {
   agent {
    docker {
        image 'ruby:2..5.2'
        label 'latest'
        args  '-v /tmp:/tmp'
    }
  }
  agent {
    // Equivalent to "docker build -f Dockerfile.build --build-arg version=1.0.2 ./build/
    dockerfile {
        filename 'Dockerfile.build'
        dir 'build'
        label 'latest'
        additionalBuildArgs  '--build-arg version=1.0.2'
    }
}
}