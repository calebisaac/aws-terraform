pipeline {
    agent any
    
    stages {
    
     stage('Terraform initialization') {
      steps {
        sh 'terraform init'
      }
        }

        stage('Terraform  plan') {
      steps {
          withAWS(credentials: 'AWS_CREDENTIALS', region: 'eu-west-2') {
        sh 'terraform plan'
         }
      }
    }

    stage('Terraform apply') {
      steps {
          
          withAWS(credentials: 'AWS_CREDENTIALS', region: 'eu-west-2') {
        sh 'terraform apply --auto-approve'
            }
        }
    }
        stage('Connect to eks cluster') {
      steps {
          withAWS(credentials: 'AWS_CREDENTIALS', region: 'eu-west-2') {
        sh 'aws eks update-kubeconfig --name myapp-eks-cluster --region eu-west-2'
             }
           }
        }
    stage('Create nginx deployment on k8s cluster') {
      steps {
        sh 'kubectl apply -f nginx.yaml'
            }
        }

    }
    
}
