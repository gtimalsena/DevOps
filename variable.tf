variable "vpc_cidr" {
    description = "Choose cidr for VPC"
    type = string
    default ="10.0.0.0/16"
}

variable "region" {
    description = "Choose region for your stack"
    type = string
    default = "us-east-1"
}

variable "nat_amis"{
    type =map
    default = {
        us-east-1 = "ami-0947d2ba12ee1ff75"
        us-east-2 = "ami-03657b56516ab7912"
    }
}

variable "web_amis"{
    type =map
    default = {
        us-east-1 = "ami-0947d2ba12ee1ff75"
        us-east-2 = "ami-03657b56516ab7912"
    }
}

variable "web_ec2_counts" {
    description = "Ec2 Webserver count"
    type = string
    default = "2"
}

variable "devops_s3_bucket" {
    default = "devops-s3-nepal"

}

variable "web_instance_type" {
    description = "Choose instance type for your web"
    type = string
    default = "t2.micro"
}

variable "web_tags"{
    type =map
    default = {
        Name = "web-server"
    }
}