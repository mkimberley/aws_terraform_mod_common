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
  sub_az          = ""
  tags            = ""
}

module "secondary_subnet" {
  source          = "../subnet/"
  sub_vpc_id      = "${aws_vpc.this.id}"
  sub_az          = ""
  tags            = ""
}

resource "aws_vpc_ipv4_cidrblock_association" "primary_cidr"{
  vpc_id                        = "${aws_vpc.this.id}"
  cidr_block                    = "${var.vpc_secondary_cidr}"
}
resource "aws_vpc_ipv4_cidrblock_association" "secondary_cidr"{
  vpc_id                        = "${aws_vpc.this.id}"
  cidr_block                    = "${var.vpc_secondary_cidr}"
}



