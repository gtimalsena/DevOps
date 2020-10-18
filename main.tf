terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Provider Configuration

provider "aws" {
  region  = "us-east-1"
}

# data configuration for dynimic use



# Resource Configuration

resource "aws_instance" "appdemo" {
  ami           = "data.aws_ami.amazonlxn.id"
  instance_type = var.instance_type # add variable here
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.websg.id]
  tags = {
    Name = "devopsdemo1"
    enviroment = "dev"
    timetolive = "10"
    backup = "yes"

  }
}