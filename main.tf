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
  tags                      = {
    Name = "Testing"
  }

  root_block_device {
    volume_size             = 16
  }
}
