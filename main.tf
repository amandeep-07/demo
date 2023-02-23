terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
    region= "ap-south-1"
}


resource "aws_instance" "ec2_instance" {
  ami                       = "ami-0f8ca728008ff5af4"
  instance_type             = "t2.medium"
  key_name                  = "Amandeep"
  user_data = <<-EOF
        #! /bin/bash
        sudo apt-get update
        sudo apt install unzip
        sudo apt-add-repository ppa:ansible/ansible -y
        sudo apt update
        sudo apt install ansible -y
        sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        sudo unzip awscliv2.zip
        sudo ./aws/install
   EOF
  tags                      = {
    Name = "Testing"
  }

  root_block_device {
    volume_size             = 16
  }
}
