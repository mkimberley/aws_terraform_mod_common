resource "aws_network_interface" "${var.iteface_name}" {
  subnet_id             = "${aws_subnet.}"
  security_groups       = ["${aws_security_group.web.id}"]

  attachment {
    instance            = "${aws_instance.test.id}"
    device_index        = 1
  }
}

resource "aws_network_interface_attachment" "data_interface" {
  instance_id          = "${aws_instance."${var.ec2_instance_name}".id}"
  network_interface_id = "${aws_network_interface.test.id}"
  device_index         = 0
}

module "tag" {
  source              = "../../aws/tags"
  ec2Name             = "${var.ec2Name}"
  ec2Environment      = "${var.ec2Environment}"
  ec2Schedule         = "${var.ec2Schedule}" 
}

resource "aws_instance" "${var.ec2_instance_name}" {
  ami                 = "${var.ami_id}"
  instance_type       = "${var.instance_type}"

  tags = {
    Name              = "${var.ec2_instance_name}"
    Environment       = "${var.Environment}"
  }
} 
