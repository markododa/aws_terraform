resource "aws_vpc" "main" {
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "backup" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "Backup"
  }
}
