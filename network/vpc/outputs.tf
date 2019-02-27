output "vpc_id" {
    description = "The VPC ID"
    value = "${aws_vpc.this.vpc_id}"
}