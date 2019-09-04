
resource "aws_network_interface" "management_interface" {
  subnet_id            = "${lookup(module.remotestate-map.subnetid, "Management")}"
  security_groups      = ["${aws_security_group.web.id}"]

  attachment           = "${aws_network_interface_attachment.management_interface.id}"
}

resource "aws_network_interface_attachment" "data_interface" {
  instance_id          = "${aws_instance.this.id}"
  network_interface_id = "${aws_network_interface.data.id}"
  device_index         = 0
}

resource "aws_network_interface" "data_interface" {
  subnet_id            = "${aws_subnet.id}"
  security_groups      = ["${aws_security_group.web.id}"]

  attachment           = "${aws_network_interface_attachment.data_interface.id}"
}

resource "aws_network_interface_attachment" "data_interface" {
  instance_id          = "${aws_instance.this.id}"
  network_interface_id = "${aws_network_interface.data.id}"
  device_index         = 0
}

module "tag" {
  source              = "../../aws/tags"
  ec2Name             = "${var.ec2Name}"
  ec2Environment      = "${var.ec2Environment}"
  ec2Schedule         = "${var.ec2Schedule}" 
}


module "ami_search" {
  source              = "../../aws/ami"
  found_ami           = "${var.ami_name}"
}

resource "aws_instance" "this" {
  ami                 = "${ami_search.found_ami}"
  instance_type       = "${var.instance_type}"

  tags = {
    Name              = "${var.ec2_instance_name}"
    Environment       = "${var.Environment}"
  }
} 
