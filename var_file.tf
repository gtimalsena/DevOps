# All Variable to go on this file

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "key_name" {
    default = "devopsdemo"
    type = string
}