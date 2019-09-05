data "aws_ami" "search" {
  count             = "${length(var.ami_name) > 0 ? 1 : 0}"
  executable_users  = ["self"]
  most_recent       = true
  owners            = ["self"]

  filter {
    name            = "tag:Name"
    values          = ["${var.ami_name}"]
  }
}
