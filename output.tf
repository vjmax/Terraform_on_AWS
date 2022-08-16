output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  #value       = aws_instance.ec2demo.public_ip    #for single instance o/p
  value       = aws_instance.ec2demo.*.public_ip  #for multiple ec2
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.ec2demo.*.private_ip
}