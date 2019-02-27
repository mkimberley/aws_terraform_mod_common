resource "aws_instance" "${var.ec2_instance_name}" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  tags = {
    Name = "${var.ec2_instance_name}"
    Environment = "${var.Environment}"
  }
} 
