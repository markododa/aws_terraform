module "instances" {
  source = "./instance/"
  sec_groups = aws_security_group.test_sec_group
  target_group_arn = aws_lb_target_group.test.arn
} 
