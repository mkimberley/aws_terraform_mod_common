variable "sub_az" {
    default = "euw2-az2"
    description = "Subnet Availability Zone"
}

variable "sub_cidr_block" {
    description = "Subnet CIDR block"
}

variable "sub_public_ip_on_launch" {
    default = "false"
    description = "Public IP address on launch, by deafult for EC2 instances"
}

variable "sub_vpc_id" {
    description = "VPC ID of the associated subnet"
}

variable "sub_environment" {
    description = "Environment tag"
    default = "production"
}

variable "sub_name" {
    description = "Subnet name"
    default = "Subnet"
}