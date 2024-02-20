

resource "aws_instance" "nginx-instance" {
  count = length(var.ec2_names)
  ami           = data.aws_ami.amazon-2.id
  instance_type = var.instance_type
  associate_public_ip_address = true

  vpc_security_group_ids = [var.sg_id]
  subnet_id = var.subnets[0]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  key_name = var.key_name
  user_data = file("${path.root}/user_data/nginx_userdata.sh")

  tags = {
    Name = "${var.ec2_names[count.index]}-Nginx-Instance"
  }

 
}