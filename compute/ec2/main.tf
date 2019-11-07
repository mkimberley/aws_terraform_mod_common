
module "environment" {
  source                = "../../remotestate-map"
  subnet_search         = "${var.ec2_subnet_name}"
}
module "tag" {
  source                = "../../aws/tags"
}
module "network_interface_security_group" {
  source               = "../../network/security_group"
  secgrp_name    = "test"
}
resource "aws_network_interface" "network_interface" {
  #subnet_id            = "${lookup(data.terraform_remote_state.*.vpc.primary_subnets_map, "${var.ec2_subnet_name}")}"
  subnet_id            = "${module.environment.vpc.outputs.private_subnets[0]}"
  security_groups      = "${module.network_interface_security_group.security_group_id}"
}
resource "aws_network_interface_attachment" "network_interface_attachment" {
 instance_id          = "${aws_instance.this.id}"
 network_interface_id = "${aws_network_interface.network_interface.id}"
  device_index         = 0
}
module "ami_search" {
  source                      = "../../aws/ami"
  ami_search_name             = "${var.ami_search_name}"
}
resource "aws_instance" "this" {
  ami                 = "${module.ami_search.ami_id}"
  instance_type       = "${var.instance_type}"
  
  tags = "${module.tag.all_tags}"
}