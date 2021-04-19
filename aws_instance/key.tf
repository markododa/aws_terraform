resource "aws_key_pair" "user" {
  key_name   = "user"
  public_key = file("id_rsa.pub")
}


