variable "ec2_instance_name" {
    default "ec2_instance_default"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "environment" {
    default = "Development"
}
variable "subnet_name" {
    default ="Front End"
}
variable "description" {
    default "EC2 Instance"
}
variable "ami_name" {
  default = "ami-0d8e27447ec2c8410"
}
