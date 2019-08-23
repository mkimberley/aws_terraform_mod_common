resource "aws_vpc" "this" {
  cidr_block                    = "${var.vpc_cidr}"
  instance_tenancy              = "${var.vpc_tenancy}"
  enable_dns_support            = "${var.vpc_enable_dns_support}"
  enable_dns_hostnames          = "${var.vpc_enable_dns_hostnames}"
  tags                          = "${var.vpc_tags}"
}

