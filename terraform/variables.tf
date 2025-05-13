variable "key_name" {
    type = string
    default = "ec2-key"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "region" {
    type = string
    default = "us-east-1"
  
}