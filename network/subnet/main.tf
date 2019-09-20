resource "aws_subnet" "this" {
  vpc_id                        = "${var.sub_vpc_id}"
  cidr_block                    = "${var.vpc_primary_subnet}"

}