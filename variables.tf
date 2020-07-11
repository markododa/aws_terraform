variable "region" {
  description  = "AWS Region"
  default      = "eu-central-1"
}

variable "aws_access_key" {
  description  = "AWS Access key stored in terraform.tfvars"
}

variable "aws_secret_key" {
  description  = "AWS Secret key stored in terraform.tfvars"
}

variable "bucket" {
  description = "Bucket name"
}
