resource "aws_subnet" "example-a-public-subnet" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = cidrsubnet(local.cidr_block, 8, 0)
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "example-a-public-subnet"
  }
}

resource "aws_subnet" "example-c-public-subnet" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = cidrsubnet(local.cidr_block, 8, 1)
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "example-c-public-subnet"
  }
}

resource "aws_subnet" "example-a-private-subnet" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = cidrsubnet(local.cidr_block, 8, 2)
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "example-a-private-subnet"
  }
}

resource "aws_subnet" "example-c-private-subnet" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = cidrsubnet(local.cidr_block, 8, 3)
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "example-c-private-subnet"
  }
}
