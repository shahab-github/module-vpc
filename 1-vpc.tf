resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${env}-${var.vpc_name}"
  }
}

