provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "terraform-tfstatefile-348979506255"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
