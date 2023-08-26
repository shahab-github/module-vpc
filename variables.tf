variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "myvpc"
}

variable "env" {
  
}

variable "private_subnets" {
  default = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "public_subnets" {
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azones" {
  default = ["us-east-1a", "us-east-1b"]
}