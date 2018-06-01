terraform {
  required_version = ">= 0.11.0"
}

variable "namespace" {
  default = "lifecycle-demo"
}

provider "aws" {
  version = ">= 1.19.0"
}

resource "aws_security_group" "training" {
  name_prefix = "${var.namespace}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "example" {
  ami           = "ami-e474db9c"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.training.id}"]

  tags {
    Name = "${var.namespace}-simple-instance"
  }
}
