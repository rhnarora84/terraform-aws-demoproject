


data "aws_security_group" "data_demo" {
    filter {
      name = "tag:Name"
      values = ["data_demo_sg"]
    }
  
}

output "name" {
  value = data.aws_security_group.data_demo.id
}