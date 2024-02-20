variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidr" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of names for the public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of names for the private subnets"
  type        = list(string)
}

variable "env_prefix" {
  description = "Environment Prefix"
  type = string
  
}