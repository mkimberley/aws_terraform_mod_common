
provider "aws" {
  region = "eu-west-2"
  
}
module "remotestate-map" {
  source "../../remotestate-map"
}
resource "aws_network_interface" "management_interface" {
  subnet_id            = "${lookup(module.remotestate-map.subnetid, "Management")}"
  security_groups      = "${var.security_group_data}"

  attachment           = "${aws_network_interface_attachment.management_interface.id}"
}

resource "aws_network_interface_attachment" "management_interface" {
  instance_id          = "${aws_instance.this.id}"
  network_interface_id = "${aws_network_interface.management_interface.id}"
  device_index         = 0
}

resource "aws_network_interface" "data_interface" {
  subnet_id            = "${aws_subnet.id}"
  security_groups      = "${var.security_group_data}"

  attachment           = "${aws_network_interface_attachment.data_interface.id}"
}

resource "aws_network_interface_attachment" "data_interface" {
  instance_id          = "${aws_instance.this.id}"
  network_interface_id = "${aws_network_interface.data_interface.id}"
  device_index         = 0
}

module "tag" {
  source                        = "../../aws/tags"
  ec2_instance_name             = "${var.ec2_instance_name}"
  ec2_instance_environment      = "${var.ec2_instance_environment}"
  ec2_instance_schedule         = "${var.ec2_instance_schedule}" 
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
