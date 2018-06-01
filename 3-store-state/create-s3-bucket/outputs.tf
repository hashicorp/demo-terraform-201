
output "bucket" {
  value = "${aws_s3_bucket.tfstate_store.bucket}"
}

output "public_ip" {
  value = "8.8.8.8"
}
