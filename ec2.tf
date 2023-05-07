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
  #profile = "default" #credentials
  region  = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket         = "my-backend-2"
    key            = "my-backend-2/terraform/terraform.tfstate" #remote location
    region         = "eu-west-2"
    dynamodb_table = "my-bucket-2-table"
  }
# Resource Block

resource "aws_instance" "ec2demo" {
  ami           = "ami-09744628bed84e434" # Amazon Linux in eu-west-2, update as per your region
  instance_type = "t2.micro"

  tags = {
    Name = "OTILLIA-SERVER2"
  }
 }
}
}
