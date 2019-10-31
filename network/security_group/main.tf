resource "aws_security_group" "this" {
  name        = "${var.secgrp_name}"
  description = "${var.secgrp_description}"
  vpc_id      = "${aws_vpc.main.id}"
}

resource "aws_security_group_rule" "this" {
  count                       = "${length(var.security_group_rule_definition)}"
  security_group_id           = "${aws_security_group.this.id}"
  type                        = "${lookup(var.secuity_group_rule_definition[count.index], "type")}"
  description                 = "${lookup(var.secuity_group_rule_definition[count.index], "description")}"
  from_port                   = "${lookup(var.secuity_group_rule_definition[count.index], "from_port")}"
  to_port                     = "${lookup(var.secuity_group_rule_definition[count.index], "to_port")}"
  protocol                    = "${lookup(var.secuity_group_rule_definition[count.index], "protocol")}"
  cidr_blocks                 = "${split(",",lookup(var.secuity_group_rule_definition[count.index], "cidr_block"))}"
}
