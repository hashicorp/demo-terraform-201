terraform {
  backend "s3" {
    bucket  = "engineering-prod-tfstate"
    key     = "use-state.tfstate"
    encrypt = true
  }
}

provider "aws" {
  version    = "~> 1.16"
}

data "terraform_remote_state" "root" {
  backend = "s3"

  config {
    bucket     = "engineering-prod-tfstate"
    key        = "root.tfstate"
  }
}
