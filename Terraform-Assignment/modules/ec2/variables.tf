variable "sg_id" {
  description = "SG ID for EC2"
  type = string
}

variable "subnets" {
  description = "Subnets for EC2"
  type = list(string)
}

variable "ec2_names" {
    description = "EC2 names"
    type = list(string)
    
}

variable "instance_type" {
  description = "Instance Type"
  type = string
  
}

variable "key_name" {
  description = "Key Pair Name"
  type = string
  
}

variable "vpc_id" {
    description = "VPC ID for ALB"
    type = string
}



variable "env_prefix" {
  description = "Environment Prefix"
  type = string
  
}