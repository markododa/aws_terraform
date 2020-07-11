provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

terraform {
  backend "s3" {
    bucket = "mdoda-tf-state"
    region = "eu-central-1"
    key = "test.tfstate"
  }
}

