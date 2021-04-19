resource "aws_instance" "fortune-instance" {
  ami           = data.aws_ami.debian.id
  instance_type = "t2.micro"
  key_name = "user"
  associate_public_ip_address = true
  subnet_id = var.subnet
  vpc_security_group_ids  = [var.sec_group]
  count = 2

  tags = {
    Name = "fortune-instance-${count.index}"
  }

  provisioner "file" {
    source      = "fortune.py"
    destination = "/home/admin/fortune.py"

    connection {
      type         = "ssh"
      user         = "admin"
      host         = self.public_ip
    }

  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/admin/fortune.py",
      "sudo apt-get update -y",
      "sudo apt-get install -y python python-pip fortune-mod",
      "sudo pip install Flask",
      "sudo systemd-run /home/admin/fortune.py"
    ]

    connection {
      type         = "ssh"
      user         = "admin"
      host         = self.public_ip
    }

  }
}

resource "aws_lb_target_group_attachment" "fortune_target_group" {
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.fortune-instance[count.index].id
  port             = 5000
  count=2
}
