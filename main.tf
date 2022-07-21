terraform {
  cloud {
    organization = "igr-org"
    workspaces {
      name = "Example-Workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-065deacbcaac64cf2"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
