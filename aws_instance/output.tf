output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.fortune-instance.*.public_ip
}

output "id" {
  value = aws_instance.fortune-instance.*.id
}

