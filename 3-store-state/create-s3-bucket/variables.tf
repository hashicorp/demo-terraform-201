# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

variable "bucket_name" {
  default = "tfstate"
}
variable "namespace" {
  default = "acme-moose-engineering-prod"
}
variable "identity" {
  default = "moose"
}
