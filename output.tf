output "public_dns" {
  value = module.instances.public_dns
}

output "lb-dns" {
value = aws_lb.fortune_lb.dns_name
}
