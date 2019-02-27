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
