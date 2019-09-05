output "ami_id" {
    value = "${element(compact(concat(data.aws_ami.search.*.id, "No AMI Found")),0)}"
}