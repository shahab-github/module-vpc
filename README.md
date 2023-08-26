This module createa a new vpc in aws

example usage:
```
module "myvpc" {
  source = "../"

  env = "dev"
  vpc_cidr_block = "192.168.0.0/16"
  private_subnets = ["192.168.10.0/24", "192.168.20.0/24"]
  public_subnets = ["192.168.1.0/24", "192.168.2.0/24"]  
}

output "vpc_id" {
    value = module.myvpc.vpc_id
}
```