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
        sh 'terraform plan'
         }
      }

    stage('Terraform apply') {
      steps {
        sh 'Terraform apply --auto-approve'
            }
        }

        stage('Connect to eks cluster') {
      steps {
        sh 'aws eks update-kubeconfig --name myapp-eks-cluster --region eu-west-2'
      }
        }

    stage('Create nginx deployment on k8s cluster') {
      steps {
        sh 'kubectl apply -f nginx.yaml'
            }
        }

    }
    
}
