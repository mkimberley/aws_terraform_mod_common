output "secgrp_id" {
    description = "The Security Group ID"
    value = "${aws_secgrp.this.id}"
}
output "secgrp_arn" {
    description = "The Security Group ARN"
    value = "${aws_secgrp.this.arn}"
}
output "secgrp_vpc_id" {
    description = "The Security Group VPC ID"
    value = "${aws_secgrp.this.vpc_id}"
}
output "secgrp_name" {
    description = "The Security Group name"
    value = "${aws_secgrp.this.name}"
}
output "secgrp_description" {
    description = "The Security Group description"
    value = "${aws_secgrp.this.description}"
}
output "secgrp_ingress" {
    description = "The Security Group ingress rules"
    value = "${aws_secgrp.this.ingress}"

}
output "secgrp_egress" {
    description = "The Security Group egress rules"
    value = "${aws_secgrp.this.egress}"
}