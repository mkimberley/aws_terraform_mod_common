terraform {
  backend "s3" {
    bucket = "somebucketforec2"
    key    = "core/poc/ec2_test/terraform.tfstate"
    region = "eu-west-2"
  }
}

