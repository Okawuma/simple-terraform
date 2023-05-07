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
  ami           = "ami-0cbf73a24cc7ff66b"
  instance_type = "mac1.metal"

  tags = {
    Name = "BUCKET-SERVER"
  }
 }

