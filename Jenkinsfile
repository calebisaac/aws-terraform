pipeline {
    agent any
    
    stages {
        
    stage('Terraform destroy') {
      steps {
          
          withAWS(credentials: 'AWS_CREDENTIALS', region: 'eu-west-2') {
        sh 'terraform destroy --auto-approve'
            }
        }
    }
       
    }
    
}
