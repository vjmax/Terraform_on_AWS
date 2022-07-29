# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.ubuntu.id 
  instance_type = var.instance_type
  key_name = var.instance_keypair  
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]  
  user_data = file("${path.module}/app1-install.sh")  #file module available in terra to cal userdata path
  tags = {
    "Name" = "EC2 Demo"
  }
}