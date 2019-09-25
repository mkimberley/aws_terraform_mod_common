terraform {
  backend "s3" {
    bucket = "mkimberley84tfstate"
    key    = "production/core/terraform.tfstate"
    region = "eu-west-2"
  }
}
