
# VPC Configuration

resource "aws_vpc" "my_first_vpc" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "devopsdemo1"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "devopsdemo_gateway" {
    vpc_id = aws_vpc.my_first_vpc.id
  
}

# VPC Subnet1

resource "aws_subnet" "devopsdemo1_subnet" {
    vpc_id = aws_vpc.my_first_vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
      "Name" = "devops_demo1_subnet"
    }
}

# VPC Subnet2

resource "aws_subnet" "devopsdemo2_subnet" {
    vpc_id = aws_vpc.my_first_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1f"
    tags = {
      "Name" = "devops_demo2_subnet"
    } 
}