output "instances" {
  value = aws_instance.nginx-instance.*.id
}

