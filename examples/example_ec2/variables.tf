variable "ec2_instance_name" {
    default = "ec2_instance_default"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "Environment" {
    default = "Production"
}
variable "subnet_id" {
    default = ""
}
variable "description" {
    default = "EC2 Instance"
}

variable "ami_name" {
  default = "ami-0a0cb6c7bcb2e4c51"
}
