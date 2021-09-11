resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }

  tags = {
    Name = "public_route"
  }
}

resource "aws_route_table_association" "public-a" {
  subnet_id      = aws_subnet.example-a-public-subnet.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "public-c" {
  subnet_id      = aws_subnet.example-c-public-subnet.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table" "private_route_a" {
  vpc_id = aws_vpc.example.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example-a-public.id
  }

  tags = {
    Name = "private_route_a"
  }
}

resource "aws_route_table" "private_route_c" {
  vpc_id = aws_vpc.example.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example-c-public.id
  }

  tags = {
    Name = "private_route_c"
  }
}

resource "aws_route_table_association" "private-a" {
  subnet_id      = aws_subnet.example-a-private-subnet.id
  route_table_id = aws_route_table.private_route_a.id
}

resource "aws_route_table_association" "private-c" {
  subnet_id      = aws_subnet.example-c-private-subnet.id
  route_table_id = aws_route_table.private_route_c.id
}
