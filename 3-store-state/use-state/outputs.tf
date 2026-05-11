# Copyright IBM Corp. 2018, 2026


output "bucket" {
  value = "${data.terraform_remote_state.root.bucket}"
}

output "public_ip" {
  value = "${data.terraform_remote_state.root.public_ip}"
}
