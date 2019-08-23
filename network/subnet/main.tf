resource "aws_subnet" "this" {
    vpc_id                  = "${var.sub_vpc_id}"
    cidr_block              = "${var.sub_cidr_block}"
    availability_zone       = "${var.sub_az}"
    map_public_ip_on_launch = "${var.sub_public_ip_on_launch}"

    tags = {
        Name = "${var.sub_name}"
        Environment = "${var.sub_environment}
    }
}
