resource "aws_instance" "test-[index.count]" {
  ami           = data.aws_ami.debian.id
  instance_type = "t2.micro"
  key_name = "user"
  security_groups = [var.sec_groups.name]
  count = 2

  tags = {
    Name = "test"
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

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.test[count.index].id
  port             = 5000
  count=2
}
