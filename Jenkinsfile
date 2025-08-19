pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "us-east-1"   // change if needed
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
                withCredentials([[ 
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'Jenkinsfile'   // ✅ your credential ID
                ]]) {
                    bat 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[ 
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'Jenkinsfile'
                ]]) {
                    bat 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Approval') {
            steps {
                input message: "Apply Terraform changes?", ok: "Yes, apply"
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[ 
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'Jenkinsfile'
                ]]) {
                    bat 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Destroy Approval') {
            steps {
                input message: "Do you want to destroy resources?", ok: "Yes, destroy"
            }
        }

        stage('Terraform Destroy') {
            steps {
                withCredentials([[ 
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'Jenkinsfile'
                ]]) {
                    // 🔹 Destroy everything
                    bat 'terraform destroy -auto-approve'

                    // OR destroy specific resource (example: S3 bucket)
                    // bat 'terraform destroy -target=aws_s3_bucket.my_bucket -auto-approve'
                }
            }
        }
    }
}
