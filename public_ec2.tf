
resource "aws_instance" "public_ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name=var.key_name
  subnet_id = aws_subnet.public-subnet.*.id[0]
  vpc_security_group_ids=[aws_security_group.allow_ssh.id]
  associate_public_ip_address=true
  tags = {
    Name = var.public_ec2_name
    Env =var.envs[0]
  }
}
