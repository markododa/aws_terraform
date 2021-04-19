resource "aws_lb" "fortune_lb" {
  name               = "fortune-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.fortune_lb_sec_group.id]
  subnets            = [aws_subnet.main.id, aws_subnet.backup.id]
  enable_deletion_protection = false
  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "fortune_lb_group" {
  name     = "fortune-lb-group"
  port     = 5000
  protocol = "HTTP"
  vpc_id = aws_vpc.fortune_vpc.id
}
resource "aws_lb_listener" "fortune_listener" {
  load_balancer_arn = "${aws_lb.fortune_lb.arn}"
  port              = "80"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.fortune_lb_group.arn}"
  }
}
