module "remotestate-map" {
  source                = "../../remotestate-map"
  subnet_search         = "${var.ec2_subnet_name}"

}
resource "aws_network_interface" "network_interface" {
  subnet_id            = "${lookup(data.terraform_remote_state.primary_subnets_map, "${var.ec2_subnet_name}")}"
  security_groups      = "${var.security_group_data}"

  attachment           = "${aws_network_interface_attachment.management_interface.id}"
}

resource "aws_network_interface_attachment" "data_interface" {
  instance_id          = "${aws_instance.this.id}"
  network_interface_id = "${aws_network_interface.data_interface.id}"
  device_index         = 0
}


module "ami_search" {
  source              = "../../aws/ami"
  ami_name           = "${var.ami_name}"
}

resource "aws_instance" "this" {
  ami                 = "${module.ami_search.ami_id}"
  instance_type       = "${var.instance_type}"

  tags = "${module.tag.all_tags}"
} 
