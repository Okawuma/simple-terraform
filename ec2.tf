# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" #credentials
  region  = "eu-west-2"
}

# Resource Block

resource "aws_instance" "ec2demo" {
  ami           = "ami-09744628bed84e434" # Amazon Linux in eu-west-2, update as per your region
  instance_type = "t2.micro"

  tags = {
    Name = "OTILLIA-SERVER"
  }
}