module "instances" {
  source = "./aws_instance/"
  sec_group = aws_security_group.fortune_sec_group.id
  subnet = aws_subnet.main.id
  target_group_arn = aws_lb_target_group.fortune_lb_group.arn
} 
