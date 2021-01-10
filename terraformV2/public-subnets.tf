resource "aws_subnet" "public-subnet" {
    count = length(data.aws_availability_zones.azs.names)
    vpc_id = aws_vpc.devops_v1.id
    cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index)
    availability_zone = data.aws_availability_zones.azs.names[count.index]
    map_public_ip_on_launch = true

    tags = {
      "Name" = "PublicSubnet0${count.index}"
    } 
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.devops_v1.id

    tags = {
      Name = "Devops-Igw"
    }
  
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.devops_v1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Devops_PRT"
  }
}

resource "aws_route_table_association" "ps_association" {
    count = length(data.aws_availability_zones.azs.names)
    subnet_id = aws_subnet.public-subnet.*.id[count.index]
    route_table_id = aws_route_table.public_rt.id
  
}
