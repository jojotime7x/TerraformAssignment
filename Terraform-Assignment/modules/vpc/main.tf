# VPC
resource "aws_vpc" "TA_VPC" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
      Name = "${var.env_prefix}-VPC"
    }
}

# Public Subnets
resource "aws_subnet" "public_subnets" {
  count = 2
  vpc_id     = aws_vpc.TA_VPC.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  
  tags = {
      Name = "${var.env_prefix}-${var.public_subnets[count.index]}-public"
  }
}

# Private Subnets
resource "aws_subnet" "private_subnets" {
  count = 2
  vpc_id     = aws_vpc.TA_VPC.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false
  
  tags = {
    Name = "${var.env_prefix}-${var.private_subnets[count.index]}-private"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.TA_VPC.id

  tags = {
    Name = "${var.env_prefix}-IGW"
  }
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.TA_VPC.id

  route {
    cidr_block = "0.0.0.0/0" # public 
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env_prefix}-PublicRT"
  }
}

# Public Route Table Association
resource "aws_route_table_association" "public_rta" {
  count = 2
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnets[0].id
}

# Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.TA_VPC.id

  route {
    cidr_block = "0.0.0.0/0" # private 
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.env_prefix}-PrivateRT"
  }
}

# Private Route Table Association
resource "aws_route_table_association" "private_rta" {
  count = 2
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_rt.id
}