pipeline {
    agent any
    
    stages {
        stage('scm checkout'){
    steps{
        script{
            checkout
          }
        }
     }
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
    post {
      failure {
      emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                                                subject: "[Jenkins] ${currentBuild.fullDisplayName}",
                                                to: 'calebisaac0@gmail.com'
      }
    }
}
