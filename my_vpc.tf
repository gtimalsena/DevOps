
/*
# VPC Configuration

resource "aws_vpc" "my_first_vpc" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "devopsdemo1"
  }
}

# Internet Gateway

resource "aws_vpc_internet_gateway" "devopsdemo_gateway" {
    vpc_id = aws_vpc.my_first_vpc.vpc_id
  
}

# VPC Subnet

resource "aws_subnet" "devopsdemo1_subnet" {
    vpc_id = aws_vpc.my_first_vpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
      "Name" = "devops_demo1_subnet"
    }
  
}
*/