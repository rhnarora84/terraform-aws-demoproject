terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.9.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "eu-central-1"
}




resource "aws_instance" "demo_webserver" {
  for_each      = var.instance_config_map
  ami           = each.value.ami
  instance_type = each.value.instance_size
  ebs_optimized = each.value.ebs
  tags = {
    Name = "MyEC2Instance_${each.key}"
  }
  region = each.key



}