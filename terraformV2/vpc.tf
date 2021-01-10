
resource "aws_vpc" "devops_v1" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "DevOPs VPC"
    Environment = terraform.workspace
    Location = "Virginia"
  }
}

# output "vpc_cidr" {
#     value = aws_vpc.devops_v1.cidr_block
# }
