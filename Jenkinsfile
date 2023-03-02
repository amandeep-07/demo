pipeline {
   agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage ("Download key from S3") {
            steps {
                sh ("sudo aws s3 cp s3://amandeep07/${workspace}/${workspace} /home/ubuntu/raj/${workspace}.pem")
                sh ("sudo chmod 400 /home/ubuntu/raj/${workspace}.pem ") 
            }
        }
        stage ("Download tag from aws and store in hosts file") {
            steps {
                sh ("aws ec2 describe-instances --filters 'Name=instance-state-name,Values=running' 'Name=tag:Name,Values=${workspace}' --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value[]]' --output text >> /home/ubuntu/hosts")
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
                sh ("aws ec2 describe-instances --filters 'Name=instance-state-name,Values=running' 'Name=tag:Name,Values=${workspace}' --query 'Reservations[].Instances[].[PrivateIpAddress]' --output text >> /home/ubuntu/hosts") 
            }
        }
        
        stage ("Run Playbook") {
            steps {
                sh ("sudo ansible-playbook playbook.yaml -i /home/ubuntu/hosts -u ubuntu --private-key /home/ubuntu/${workspace}.pem --check") 
            }
        }
    }
}
