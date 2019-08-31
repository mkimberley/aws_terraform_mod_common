data "aws_ami" "search" {
  executable_users  = ["self"]
  most_recent       = true
  owners            = ["self"]

  filter {
    name            = "name"
    values          = ["${var.ami_name}"]
  }
}
