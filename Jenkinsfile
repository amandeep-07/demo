pipeline {
    agent any
    stages {
     stage('Ansible Deploy') {          
            steps {        
              sh "ansible all -m ping -u ubuntu --private-key /home/ubuntu/Amandeep.ppk"
            }
     }
    }
}
