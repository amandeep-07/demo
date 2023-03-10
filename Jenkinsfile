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

        stage ("Download key from S3") {
            steps {
                sh ("sudo aws s3 cp s3://amandeep07/${workspace}/${workspace} ${workspace}.pem")
                sh ("sudo chmod 400 ${workspace}.pem ") 
            }
        }
        stage ("Download tag from aws and store in hosts file") {
            steps {
                sh ("aws ec2 describe-instances --filters 'Name=instance-state-name,Values=running' 'Name=tag:Name,Values=${workspace}' --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value[]]' --output text >> tag")
            }
        }
         
        stage ("Run hosts script") {
            steps {
                sh ("sudo chmod 777 ansible-host.sh")
                sh ("./ansible-host.sh") 
            }
        }
       
        stage ("Download Private key") {
            steps {
                sh ("aws ec2 describe-instances --filters 'Name=instance-state-name,Values=running' 'Name=tag:Name,Values=${workspace}' --query 'Reservations[].Instances[].[PrivateIpAddress]' --output text >> hosts") 
            }
        }
        
        stage ("Run Playbook") {
            steps {
                sh ("sudo ansible-playbook playbook.yaml -i hosts -u ubuntu --private-key ${workspace}.pem ") 
            }
        }
        stage ("Delete key,hosts") {
            steps {
               sh ("sudo rm ${workspace}.pem hosts tag") 
            }
        }
    }
}
