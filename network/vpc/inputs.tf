variable "vpc_name" {
    default = "default_vpc_name"
}
variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "vpc_tenancy" {
    default = "default"
}

variable "vpc_environment" {
    default "production"
}