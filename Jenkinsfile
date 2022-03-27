pipeline {
  environment {
    registry = "rashmigarg16/application"
    registryCredential = 'rashmigarg16'
    dockerImage = ''
  }
  agent any
  
  
  stages {
   
     stage('Install Dependencies') { 
        steps { 
           sh 'npm install' 
        }
     }
   
    stage('Build') {
    steps {
       sh 'export NODE_OPTIONS=--openssl-legacy-provider'
       sh 'npm run client'
     }
  }

    stage('Build Docker') {
       steps {
         sh 'docker build -t application .'
       }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
