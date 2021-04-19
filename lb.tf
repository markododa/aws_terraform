resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sec_group.id]
  subnets            = ["subnet-b5db1cf9", "subnet-03fd0d7f"]
  enable_deletion_protection = false
  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 5000
  protocol = "HTTP"
  vpc_id = "vpc-353be95f"
}
resource "aws_lb_listener" "test" {
  load_balancer_arn = "${aws_lb.test.arn}"
  port              = "80"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.test.arn}"
  }
}
