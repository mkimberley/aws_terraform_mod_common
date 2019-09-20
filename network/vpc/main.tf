resource "aws_vpc" "this" {
  cidr_block                    = "${var.vpc_cidr}"
  instance_tenancy              = "${var.vpc_instance_tenancy}"
  enable_dns_support            = "${var.vpc_enable_dns_support}"
  enable_dns_hostnames          = "${var.vpc_enable_dns_hostnames}"
  tags                          = "${var.vpc_tags}"
}

module "primary_subnet" {
  source                        = "../subnet/"
  sub_vpc_id                    = "${aws_vpc.this.id}"
  sub_environment               = "${var.vpc_environment}"
  sub_cidr_block                = "${var.vpc_primary_cidr}"
  sub_az                        = "${var.vpc_primary_az}"
  sub_name                      = "${var.vpc_primary_subnet_name}"
  sub_public_ip_on_launch       = "${var.vpc_primary_public_ip_on_lauch}"
}

module "secondary_subnet" {
  source                        = "../subnet/"
  sub_vpc_id                    = "${aws_vpc.this.id}"
  sub_environment               = "${var.vpc_environment}"
  sub_cidr_block                = "${var.vpc_secondary_cidr}"
  sub_az                        = "${var.vpc_secondary_az}"
  sub_name                      = "${var.vpc_secondary_subnet_name}"
  sub_public_ip_on_launch       = "${var.vpc_secondary_public_ip_on_lauch}"
}


