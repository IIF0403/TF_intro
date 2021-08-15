terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "remote" {
    organization = "sopratest-org"
    workspaces {
      name = "Example-Workspace"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "EC2_1" {
  #ami           = "ami-830c94e3"
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

resource "aws_vpc" "vpc_1" {
  cidr_block = "10.1.0.0/16" #"10.0.0.0/16"
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "10.1.0.0/24"

  tags = {
    Name = var.subnet_name
  }
}
