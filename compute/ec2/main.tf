resource "aws_network_interface" "${var.iteface_name}" {
}

resource "aws_network_interface_attachment" "data_interface" {

}

module "tag" {
  source          = "../../aws/tags"
  ec2Name         = "${var.ec2Name}"
  ec2Environment  = "${var.ec2Environment}"
  ec2Schedule     = "${var.ec2Schedule}" 
}

resource "aws_instance" "${var.ec2_instance_name}" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  tags = {
    Name = "${var.ec2_instance_name}"
    Environment = "${var.Environment}"
  }
} 
