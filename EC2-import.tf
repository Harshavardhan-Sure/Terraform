resource "aws_instance" "ec2-import" {
  ami = "ami-098e42ae54c764c35"
  instance_type = var.instance_type
  key_name=var.key_name
  subnet_id = "subnet-084d950efa8cc8182"
  
  associate_public_ip_address=true
  tags = {
    Name = "EC2-import"
    Env =var.envs[0]
  }
}
