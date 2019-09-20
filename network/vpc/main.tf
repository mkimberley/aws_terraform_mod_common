resource "aws_vpc" "this" {
  cidr_block                    = "${var.vpc_primary_cidr}"
  instance_tenancy              = "${var.vpc_tenancy}"
  enable_dns_support            = "${var.vpc_enable_dns_support}"
  enable_dns_hostnames          = "${var.vpc_enable_dns_hostnames}"
  
  tags                          = "${var.vpc_tags}"
}

module "primary_subnet" {
  source          = "../subnet/"
  sub_vpc_id      = "${aws_vpc.this.id}"
  sub_environment = "${var.vpc_environment}"
  sub_cidr_block  = "${var.vpc_primary_cidr}"
  sub_az          = "${var.primary_az}"
  sub_tags        = "${var.vpc_tags}"
  sub_name        = "${var.vpc_primary_subnet_name}"
}

module "secondary_subnet" {
  source          = "../subnet/"
  sub_vpc_id      = "${aws_vpc.this.id}"
  sub_environment = "${var.vpc_environment}"
  sub_cidr_block  = "${var.vpc_secondary_cidr}"
  sub_az          = "${var.vpc_secondary_az}"
  sub_tags        = "${var.vpc_tags}"
  sub_name        = "${var.vpc_secondary_subnet_name}"

}


resource "aws_vpc_ipv4_cidr_block_association" "primary_cidr" {
  vpc_id                        = "${aws_vpc.this.id}"
  cidr_block                    = "${var.vpc_secondary_cidr}"
}
resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id                        = "${aws_vpc.this.id}"
  cidr_block                    = "${var.vpc_secondary_cidr}"
}



