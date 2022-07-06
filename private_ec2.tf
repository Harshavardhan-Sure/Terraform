
resource "aws_instance" "private_ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name=var.key_name
  subnet_id = aws_subnet.private-subnet.*.id[0]
  vpc_security_group_ids=[aws_security_group.allow_ssh.id]

  tags = {
    Name = var.private_ec2_name
    Env =var.envs[0]
  }
}
