resource "aws_subnet" "private-subnet" {
    count = length(slice(data.aws_availability_zones.azs.names, 0, 2 ))
    vpc_id = aws_vpc.devops_v1.id
    cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index + length(data.aws_availability_zones.azs.names))
    availability_zone = data.aws_availability_zones.azs.names[count.index]

    tags = {
      "Name" = "PrivateSubnet0${count.index}"
    } 
}

resource "aws_instance" "nat" {
    ami = var.nat_amis[var.region]
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-subnet.*.id[0]
    source_dest_check = false
    vpc_security_group_ids = [aws_security_group.nat_sg.id]
    # associate_public_ip_address = true

    tags = {
      Name = "DevopsNat"
    }
  
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.devops_v1.id

  route {
    cidr_block = "0.0.0.0/0"
    instance_id = aws_instance.nat.id
  }

  tags = {
    Name = "Devops_Private_rt"
  }
}

resource "aws_route_table_association" "private_association" {
    count = length(slice(data.aws_availability_zones.azs.names, 0, 2 ))
    subnet_id = aws_subnet.private-subnet.*.id[count.index]
    route_table_id = aws_route_table.private_rt.id
  
}


