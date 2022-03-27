pipeline { 
  
  agent any
  tools 
    {
        nodejs 'Node'
    }
  
  environment {
    registry = "rashmigarg16/application"
    registryCredential = 'rashmigarg16'
    dockerImage = ''
  }

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
      }
    }  
     
     stage('Build Image') {
       steps {
         sh 'docker build -t application .'
       }
    }
     
     stage('Test') { 
        steps { 
           sh 'echo "testing application..."'
        }
      }

         stage("Deploy application") { 
         steps { 
           sh 'echo "deploying application..."'
         }

     }
  
   	}

   }


pipeline {
  agent any
    tools 
    {
        nodejs 'Node'
    }
  environment {
    registry = "rashmigarg16/application"
    registryCredential = 'rashmigarg16'
    dockerImage = ''
  }
  
  stage('Install Dependencies') { 
        steps { 
           sh 'npm install' 
        }
     }
     
     stage('Build') {
      steps {
         sh 'export NODE_OPTIONS=--openssl-legacy-provider'
         sh 'npm run dev'
      }
    }  
    stage('Build Image') {
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

