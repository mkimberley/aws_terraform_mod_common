variable "vpc_name" {
    default = "default_vpc_name"
}
variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "vpc_environment" {
    default = "production"
}
variable "vpc_instance_tenancy" {
    default = ""
}
variable "vpc_enable_dns_hostnames" {
    default = true
}
variable "vpc_enable_dns_support" {
    default = true
}
variable "vpc_primary_sub_cidr" {
    default = "10.60.0.0/24"
}
variable "vpc_secondary_sub_cidr" {
    default = "10.61.0.0/24"
}
variable "vpc_primary_az" {
    default = ["eu-west-2a"]
}
variable "vpc_secondary_az" {
    default = ["eu-west-2a"]
}
variable "vpc_tags" {
    type = map(string)
    default = {}
}
variable "vpc_primary_subnet_name" {
    default = "VPC Primary Subnet"
}
variable "vpc_secondary_subnet_name" {
    default = "VPC Secondary Subnet"
}
variable "vpc_secondary_public_ip_on_launch" {
    default = "false"
}
variable "vpc_primary_public_ip_on_launch" {
    default = "false"
}
variable "nat_subnet" {
    default = ""
}
