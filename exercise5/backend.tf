terraform {
  backend "s3" {
    bucket = "terraform-bucket-18092023"
    key = "terraform/backend"
    region = "us-east-1"

  }
}