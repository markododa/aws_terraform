resource "aws_vpc" "fortune_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "fortune-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.fortune_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "backup" {
  vpc_id     = aws_vpc.fortune_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "Backup"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.fortune_vpc.id
}

resource "aws_route_table" "tf-route-public" {
  vpc_id = aws_vpc.fortune_vpc.id
  route {
	cidr_block = "0.0.0.0/0"
	gateway_id = aws_internet_gateway.gw.id
	}
 tags = {
	Name = "tf route public"
	}
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.fortune_vpc.id
  route_table_id = aws_route_table.tf-route-public.id
}
