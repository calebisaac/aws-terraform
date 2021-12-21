pipeline {
    agent any
    
    stages {
    
          stage('run script') {
      steps {
          
          withAWS(credentials: 'AWS_CREDENTIALS', region: 'eu-west-2') {
        sh 'chmod +x ./script.sh'
        sh './script.sh'
            }
        }
    }
       
        
    stage('Terraform destroy') {
      steps {
          
          withAWS(credentials: 'AWS_CREDENTIALS', region: 'eu-west-2') {
        sh 'terraform destroy --auto-approve'
            }
        }
    }
       
    }
    
}
