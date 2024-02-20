// VPC CIDR block
vpc_cidr = "10.0.0.0/16"

// Public subnet CIDR blocks
public_subnet_cidr = [ "10.0.1.0/24", "10.0.2.0/24" ]

// Private subnet CIDR blocks
private_subnet_cidr = [ "10.0.3.0/24", "10.0.4.0/24" ]

// Key pair name for EC2 instances which is already created in aws console
key_name = "sathish"

// Names of EC2 instances
ec2_names = ["nginx-server"]

// Names of public subnets
public_subnets = ["public-subnet-1", "public-subnet-2"]

// Names of private subnets
private_subnets = ["private-subnet-1", "private-subnet-2"]

// Environment prefix
env_prefix = "TA-dev" // TA stands for Terraform Assignment


instance_type = "t2.micro"