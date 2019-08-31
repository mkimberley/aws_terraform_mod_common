output "ami_id" {
    description = "Returns the ID of the latest AMI found"
    value = "${aws_ami.this.id}"
}