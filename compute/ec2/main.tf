variable "aws_bucket" {
    default = "mkimberley84tfstate"
}
variable "aws_key" {
    default = "production/core/terraform.tfstate"
}

variable "aws_region" {
    default = "eu-west-2"
}
data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
        bucket  = "${var.aws_bucket}"
        key     = "${var.aws_key}"
        region  = "${var.aws_region}"
    }
}
#
#module "remotestate-map" {
#  source                = "../../remotestate-map"
#  subnet_search         = "${var.ec2_subnet_name}"
#}
module "tag" {
  source                = "../../aws/tags"
}
resource "aws_network_interface" "network_interface" {
  #subnet_id            = "${lookup(data.terraform_remote_state.*.vpc.primary_subnets_map, "${var.ec2_subnet_name}")}"
  subnet_id            = "${data.terraform_remote_state.vpc.outputs.private_subnets[0]}"
  security_groups      = "${var.security_group_data}"
}

resource "aws_network_interface_attachment" "network_interface_attachment" {
 instance_id          = "${aws_instance.this.id}"
 network_interface_id = "${aws_network_interface.network_interface.id}"
  device_index         = 0
}


module "ami_search" {
  source              = "../../aws/ami"
  ami_search_name            = "${var.ami_search_name}"
}

resource "aws_instance" "this" {
  ami                 = "${module.ami_search.ami_id}"
  instance_type       = "${var.instance_type}"
  
  tags = "${module.tag.all_tags}"
}