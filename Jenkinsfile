pipeline {
    agent any

    environment {
        AWS_REGION = "ap-south-1"   // change if needed
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Avi171717/terraform-aws-infra.git'
            }
        }

        stage('Terraform Init') {
            steps {
                withAWS(credentials: 'aws-creds', region: "${AWS_REGION}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                withAWS(credentials: 'aws-creds', region: "${AWS_REGION}") {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Do you want to apply these changes?', ok: 'Yes, apply'
                withAWS(credentials: 'aws-creds', region: "${AWS_REGION}") {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
}
