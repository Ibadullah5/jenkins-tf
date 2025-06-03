pipeline {
    agent any
    
    tools {
        terraform 'Terraform'
    }

    environment {
        TF_IN_AUTOMATION = 'true'
        TF_INPUT = 'false'
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_SESSION_TOKEN = credentials('AWS_SESSION_TOKEN')
    }

    parameters {
        booleanParam defaultValue: true, description: 'Set to destroy infra immediately after it is created', name: 'Also destroy infra'
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
        stage('Terraform Destroy') {
            when {
                expression { return params.DESTROY_INFRA == true }
            }
            steps {
                    sh 'terraform destroy -auto-approve'
            }
        }
    }
}
