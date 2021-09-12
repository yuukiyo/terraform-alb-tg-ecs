output "vpc_id" {
  value = aws_vpc.example.id
}

output "example-a-public-subnet_id" {
  value = aws_subnet.example-a-public-subnet.id
}

output "example-c-public-subnet_id" {
  value = aws_subnet.example-c-public-subnet.id
}

output "example-a-private-subnet_id" {
  value = aws_subnet.example-a-private-subnet.id
}

output "example-c-private-subnet_id" {
  value = aws_subnet.example-c-private-subnet.id
}
