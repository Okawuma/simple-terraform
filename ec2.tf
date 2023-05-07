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
    bucket         = "my-backend-bucket1"
    key            = "my-backend-bucket1/terraform/terraform.tfstate" 
    region         = "eu-west-2"
    dynamodb_table = "my-bucketable-2"
  }
}
resource "aws_instance" "Archie" {
  ami           = "ami-08d9bb4bfe39be5c2"
  instance_type = "t2.micro"

  tags = {
    Name = "BUCKET-SERVER"
  }
 }

