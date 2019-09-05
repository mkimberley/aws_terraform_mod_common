variable "vpc_name" {
    default = "default_vpc_name"
}
variable "vpc_cidr" {
    default = "10.0.0.0/8"
}
variable "vpc_tenancy" {
    default = "default"
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
variable "vpc_primary_cidr" {
    default = "10.60.0.0/24"
}
variable "vpc_secondary_cidr" {
    default = "10.61.0.0/24"
}
variable "vpc_tags" {
    default = {}
}
