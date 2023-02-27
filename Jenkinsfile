pipeline {
    agent any
    stages {
     stage('Ansible Deploy') {          
            steps {        
             // sh "ansible all -m ping -u ubuntu --private-key /home/ubuntu/ansible-testing.pem"
              sh "ansible-playbook /var/lib/jenkins/workspace/ansible-automation/playbook.yaml -i /var/lib/jenkins/workspace/ansible-automation/hosts --private-key /home/ubuntu/ansible-testing.pem"
             //sh "ansible-playbook /path/to/ansible-playbook.yml -i hosts -u AUTO_USER --private-key=/path/to/private-key"
            }
     }
    }
}
