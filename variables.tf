
# variable "instance_type" {
#   description = "value of the instance type"
#   type        = string
#   default     = "t2.micro"
#   validation {
#     condition     = var.instance_type == "t2.micro" || var.instance_type == "t3.micro" || var.instance_type == "t3.small"
#     error_message = "You must choose either of these three instance types: t2.micro, t3.micro or t3.small"
#   }

# }


# variable "root_volume_type" {
#   description = "Type of the root volume"
#   type        = string
#   default     = "gp2"
#   validation {
#     condition     = var.root_volume_type == "gp2" || var.root_volume_type == "gp3"
#     error_message = "Choose either of these two root volume types: gp2 or gp3"
#   }

# }

# variable "root_volume_size" {
#   description = "The size of the root volume"
#   type        = number
#   default     = 8
#   validation {
#     condition     = var.root_volume_size >= 8 && var.root_volume_size <= 30
#     error_message = "The size of the root volume must be between 8 and 30GB"
#   }

# }


variable "root_block_device" {
  description = "The size of the root volume"
  type = object({
    vol_size = number
    vol_type = string
  })

  default = {
    vol_size = 8
    vol_type = "gp2"

  }

  validation {
    condition     = var.root_block_device.vol_size >= 8 && var.root_block_device.vol_size <= 30
    error_message = "The size of the root volume must be between 8 and 30GB"
  }

  validation {
    condition     = var.root_block_device.vol_type == "gp2" || var.root_block_device.vol_type == "gp3"
    error_message = "Choose either of these two root volume types: gp2 or gp3"
  }

}


# variable "region_map" {
#   type = map(string)
#   default = {
#     "us-east-1"    = "ami-0fa3fe0fa7920f68e"
#     "eu-central-1" = "ami-06d0d10b90c87f34d"
#   }

# }




variable "instance_config_map" {
  type = map(object({
    ami           = string
    instance_size = string
    ebs           = bool
  }))

  default = {
    "us-west-1" = {
      ami           = "ami-03978d951b279ec0b"
      instance_size = "t2.micro"
      ebs           = false
      region        = "us-west-1"
    }

    "eu-central-1" = {
      ami           = "ami-06d0d10b90c87f34d"
      instance_size = "t3.micro"
      ebs           = false
      region        = "eu-central-1"
    }

  }

}

