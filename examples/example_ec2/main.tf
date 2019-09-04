module "ec2_instance" {
    source = "../ec2/"

    ec2_instance_name       = "${var.ec2_instance_name}"
    instance_type           = "${var.instance_type}"
    environment             = "${var.environment}"
    description             = "${var.description}"
    ami_name                = "${var.ami_name}"
    subnet_name             = "${var.subnet_name}"


}