resource "aws_subnet" "public-subnet" {
  count=length(var.public_subnet_cidr)
    vpc_id = aws_vpc.testvpc.id
    cidr_block = element(var.public_subnet_cidr,count.index)
    availability_zone = element(data.aws_availability_zones.available.names, count.index)
    tags = {
    Name = "${var.public_subnet_name}-${count.index + 1}"
    env=var.envs[0]
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.testvpc.id

  tags = {
    Name = "Public-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.testvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}


resource "aws_route_table_association" "association" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public-subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}
