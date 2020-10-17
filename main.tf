terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}


provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "appdemo" {
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
  key_name = "Oct1"
  tags = {
    "Name" = "appdemo1"
  }
}