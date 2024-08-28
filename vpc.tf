resource "aws_vpc" "multitier-vpc" {
  cidr_block       = var.vpc-cidr-block
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = var.vpc-name
  }
}

