output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.myec2vm.public_ip
}
output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.myec2vm.private_ip
}