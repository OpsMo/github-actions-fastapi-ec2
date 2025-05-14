variable "key_name" {
  type    = string
  default = "ec2-key"
}

variable "ec2_ami" {
  type    = string
  default = "ami-0953476d60561c955"
  
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}

variable "region" {
  type    = string
  default = "us-east-1"

}