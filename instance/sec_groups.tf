resource "aws_security_group" "allow_tls" {
  name        = "test_sec_group"
  description = "test sec group"
#  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
#   cidr_blocks = [aws_vpc.main.cidr_block]
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow"
  }
}

