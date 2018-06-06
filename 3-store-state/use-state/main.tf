variable "primary_bucket_name" {
  default = "acme-moose-prod-tfstate"
}

terraform {
  backend "s3" {
    bucket  = "acme-moose-prod-tfstate"
    key     = "use-state.tfstate"
    encrypt = true
  }
}

provider "aws" {
  version    = "=> 1.20.0"
}

data "terraform_remote_state" "root" {
  backend = "s3"

  config {
    bucket     = "${var.primary_bucket_name}"
    key        = "root.tfstate"
  }
}
