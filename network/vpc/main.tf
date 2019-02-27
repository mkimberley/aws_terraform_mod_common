resource "aws_vpc" "${var.vpc_name}" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.vpc_tenancy}"

  tags = {
    Name = "${var.vpc_name}"
    Environment = "${var.vpc_environment}"
  }
}