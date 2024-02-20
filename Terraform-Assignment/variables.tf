# Purpose: Define the variables that will be used in the Terraform VPC module
# The variables are used to define the input parameters for the VPC, security group, and EC2 instances
# Author: Sathish Jonnalagadda
# Creation Date: 19-02-2024
# Modified Date: 19-02-2024


variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type = string
}



variable "key_name" {
  description = "Key Pair Name"
  type = string
  
}
variable "ec2_names" {
    description = "EC2 names"
    type = list(string)
  
}

variable "instance_type" {
  description = "Instance Type"
  type = string
  
}



variable "public_subnets" {
    description = "Public Subnet Name"
    type = list(string)
  
  
}

variable "private_subnet_cidr" {
    description = "Private Subnet CIDR"
    type = list(string)
  
}

variable "public_subnet_cidr" {
    description = "Public Subnet CIDR"
    type = list(string)
  
}

variable "private_subnets" {
  description = "Private Subnet Name"
  type = list(string)
}


variable "env_prefix" {
  description = "Environment Prefix"
  type = string
  
}