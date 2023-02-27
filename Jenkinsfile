pipeline {
    agent any
    stages {
     stage('Ansible Deploy') {          
            steps {        
              sh "sudo ansible all -m ping -u ubuntu --private-key /home/ubuntu/ansible-testing.pem -y"
            }
     }
    }
}
