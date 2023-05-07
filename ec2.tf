terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {

  region  = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket         = "my-backend-2"
    key            = "my-backend-2/terraform/terraform.tfstate" 
    region         = "eu-west-2"
    dynamodb_table = "my-bucket-2-table"
  }

resource "aws_instance" "ec2demo" {
  ami           = "ami-09744628bed84e434"
  instance_type = "t2.micro"

  tags = {
    Name = "OTILLIA-SERVER2"
  }
 }
}
