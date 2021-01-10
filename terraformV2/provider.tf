provider "aws" {
  region = var.region
}

# terraform {
#     backend "s3" {
#     bucket = "devops-tf-0123456"
#     key = "terraform.tfstate"
#     region = "us-east-1"
#     dynamodb_table = "devops"
#     }
# }
