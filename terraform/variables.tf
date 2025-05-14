variable "key_name" {
  type    = string
  default = "ec2-key"
}

variable "ec2_ami" {
  type    = string
  default = "ami-085386e29e44dacd7"

}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}

variable "region" {
  type    = string
  default = "us-east-1"
}