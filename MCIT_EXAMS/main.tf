provider "aws" {
  region = "us-east-1"
Variables
  access_key = var.aws_access_key
   secret_key = var.aws_secret_key
}

 VPC Module
module "vpc" {
  source             = "github.com/hashicorp/aws"
  region             = "us-east-1" 
  vpc_cidr           = "10.0.0.0/16" 
  subnet_cidrs       = ["10.0.1.0/24", "10.0.2.0/24"]  
  availability_zones = ["us-east-1a", "us-east-1b"] 
}

# EC2 Module
module "ec2" {
  source       = "github.com/hashicorp/aws"
  region       = "us-east-1"
  ami_id       = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.vpc_id
}

