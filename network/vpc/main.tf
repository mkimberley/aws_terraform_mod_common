resource "aws_vpc" "${vpc_name}" {
  cidr_block       = "${vpc_cidr}"
  instance_tenancy = "${vpc_tenancy}"

  tags = {
    Name = "${vpc_name}"
    Environment = "${vpc_environment}"
  }
}