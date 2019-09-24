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

