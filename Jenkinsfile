pipeline {
   environment {
        AWS_CREDENTIALS = credentials('jenkins-terraform')
    }
   agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage ("terraform init") {
            steps {
                sh ("terraform init -reconfigure") 
            }
        }

        stage ("terraform validate") {
            steps {
                sh ("terraform validate") 
            }
        }
        stage ("plan") {
            steps {
                sh ('terraform plan -out=plan.tf') 
            }
        }
        
        stage('Approval') {
            steps {
                script {
                def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
                }
            }
        }

        stage (" Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve -input=false -no-color plan.tf') 
           }
        }
    }
}
