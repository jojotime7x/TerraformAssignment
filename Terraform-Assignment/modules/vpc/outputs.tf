output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.TA_VPC.id
}

output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public_subnets.*.id
}

output "private_subnets" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private_subnets.*.id
}

output "public_route_table" {
  description = "The ID of the public route table"
  value       = aws_route_table.public_rt.id
}

output "private_route_table" {
  description = "The ID of the private route table"
  value       = aws_route_table.private_rt.id
}

output "nat_gateway" {
  description = "The ID of the NAT gateway"
  value       = aws_nat_gateway.nat.id
}

output "subnet_ids" {
  description = "The IDs of all subnets"
  value       = concat(aws_subnet.public_subnets.*.id, aws_subnet.private_subnets.*.id)
}