pipeline {
    agent any
    stages {
     stage('Ansible Deploy') {          
            steps {        
             // sh "ansible all -m ping -u ubuntu --private-key /home/ubuntu/ansible-testing.pem"
              sh "sudo ansible-playbook playbook.yaml -u ubuntu --private-key /home/ubuntu/ansible-testing.pem --check"
             //sh "ansible-playbook /path/to/ansible-playbook.yml -i hosts -u AUTO_USER --private-key=/path/to/private-key"
            }
     }
    }
}
