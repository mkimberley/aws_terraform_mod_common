terraform {
  backend "s3" {
    bucket = "mkimberley84tfstate"
    key    = "production/ec2_example/terraform.tfstate"
    region = "eu-west-2"
  }
}
