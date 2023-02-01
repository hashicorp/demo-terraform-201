# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT


output "bucket" {
  value = "${data.terraform_remote_state.root.bucket}"
}

output "public_ip" {
  value = "${data.terraform_remote_state.root.public_ip}"
}
