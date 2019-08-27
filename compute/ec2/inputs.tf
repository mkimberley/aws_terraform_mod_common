variable "ec2_instance_name" {
    default "ec2_instance_default"
}

variable "ami_id" {}

variable "instance_type" {
    default = "t2.micro"
}
variable "Environment" {
    default = "Production"
}
variable "subnet_id" {
    default =""
}
variable "description" {
    default "EC2 Instance"
}
variable "private_ips" {}
variable "private_ips_count" {}
variable "security_groups" {}
variable "attachment" {}
variable "source_dest_check" {}
variable "tags" {}
variable "instance" {}
variable "device_index" {}