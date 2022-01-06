pipeline {
    agent any
    
    stages {
        
     stage('Delete nginx deployment') {
      steps {
          
          withAWS(credentials: 'AWS_CREDENTIALS', region: 'eu-west-2') {
        sh 'kubectl delete -f nginx.yaml'
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
