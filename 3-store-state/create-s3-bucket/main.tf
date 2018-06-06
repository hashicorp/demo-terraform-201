# terraform {
#   backend "s3" {
#     bucket  = "acme-moose-prod-tfstate"
#     key     = "root.tfstate"
#     encrypt = true
#   }
# }

provider "aws" {
  version    = "=> 1.20.0"
}

resource "aws_s3_bucket" "tfstate_store" {
  bucket = "${var.namespace}-${var.bucket_name}"
  acl    = "private"
  force_destroy = true

  tags {
    Created-by  = "Terraform"
    Environment = "dev"
    Owner       = "${var.identity}"
  }

  versioning {
    enabled = true
  }

  logging {
    target_bucket = "${aws_s3_bucket.logs.id}"
    target_prefix = "log/"
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${var.namespace}-logs"
  acl    = "log-delivery-write"

  tags {
    Created-by  = "Terraform"
    Environment = "dev"
    Owner       = "${var.identity}"
  }
}
