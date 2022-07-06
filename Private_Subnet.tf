resource "aws_subnet" "private-subnet" {
  count=length(var.private_subnet_cidr)
    vpc_id = aws_vpc.testvpc.id
    cidr_block = element(var.private_subnet_cidr,count.index)
    availability_zone = element(data.aws_availability_zones.available.names, count.index)
    tags = {
    Name = "${var.private_subnet_name}-${count.index + 1}"
    env=var.envs[0]
  }
}




resource "aws_eip" "eip" {
  vpc = true
}


resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public-subnet.*.id[0]
}



resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.testvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw.id
  }

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}


resource "aws_route_table_association" "private_association" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private-subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}
