
resource "aws_security_group" "web_sg" {
    name = "web_sg"
    description = "allows http traffic"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

/*
    egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }
*/

    tags = {
        Name = "Web_Access"
    }
}

resource "aws_security_group" "ssh_sg" {
    name = "ssh_sg"
    description = "For SSH Access"
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
/*
    egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }
*/
    tags = {
        Name = "SSH_Access"
    }
}

resource "aws_security_group" "web_vpc" {
    name = "web_vpc"
    description = "allows http traffic"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

/*
    egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }
*/

    tags = {
        Name = "Web_Access"
    }
}
