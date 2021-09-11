resource "aws_eip" "nat-a" {
  tags = {
    Name = "nat-a-public"
  }
}

resource "aws_eip" "nat-c" {
  tags = {
    Name = "nat-c-public"
  }
}

resource "aws_nat_gateway" "example-a-public" {
  allocation_id = aws_eip.nat-a.id
  subnet_id     = aws_subnet.example-a-public-subnet.id

  tags = {
    Name = "example-a-public"
  }
  depends_on = [aws_internet_gateway.example]
}

resource "aws_nat_gateway" "example-c-public" {
  allocation_id = aws_eip.nat-c.id
  subnet_id     = aws_subnet.example-c-public-subnet.id

  tags = {
    Name = "example-c-public"
  }
  depends_on = [aws_internet_gateway.example]
}
