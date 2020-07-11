resource "aws_instance" "test" {
  ami           = data.aws_ami.debian.id
  instance_type = "t2.micro"
  key_name = "user"
  security_groups = ["test_sec_group"]

  tags = {
    Name = "test"
  }
}
