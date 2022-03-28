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
       sh 'npm run dev'
       sh 'export NODE_OPTIONS=--openssl-legacy-provider'

     }
  }

//     stage('Build Docker') {
//        steps {
//          sh 'docker build -t rashmigarg16/application:$BUILD_NUMBER .'
//        }
//     }
 
//     stage('Deploy Image') {
//       steps{
//          sh '''
//             docker.withRegistry( '', registryCredential ) 
//             docker push rashmigarg16/application:$BUILD_NUMBER 
//             '''
            
//       }}
      }
    }
  

