# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.ubuntu.id 
  instance_type = var.instance_type_list[1]      #for list we set address of each type
  #instance_type = var.instance_type_map["prod"]  #for map we set the key
  key_name = var.instance_keypair  
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]  
  user_data = file("${path.module}/app1-install.sh")  #file module available in terra to cal userdata path
  count = 2
  tags = {
    "Name" = "Count-Demo-${count.index}"  #count index mean it will name the instance from 0,1
  }
}