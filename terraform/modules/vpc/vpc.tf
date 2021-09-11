resource "aws_vpc" "example" {
  cidr_block = local.cidr_block
  tags = {
    Name = "example-vpc"
  }
}
