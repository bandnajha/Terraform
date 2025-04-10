# Terraform settings Block
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        #version = ~> "3.21" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default"
  region = "us-east-1"
} 

#Resource Block
resource "aws_instance" "myec2vm" {
    ami = "ami-071226ecf16aa7d96"
    instance_type = "t2.micro" 
    user_data = file("${path.module}/app1-install.sh")
    tags = {
      "Name" = "Ec2 Demo"
    }
}