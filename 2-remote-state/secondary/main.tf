terraform {}

data "terraform_remote_state" "primary" {
  backend = "local"
  config {
    path = "../primary/terraform.tfstate"
  }
}

output "primary_public_ip" {
  value = "${data.terraform_remote_state.primary.public_ip}"
}

output "primary_destination" {
  value = "${data.terraform_remote_state.primary.destination}"
}
