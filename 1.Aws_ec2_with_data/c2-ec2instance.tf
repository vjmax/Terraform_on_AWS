#resource_Sg
resource "aws_security_group" "web-sg" {
  name = "allow_all"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = "ami-07eaf27c7c4a884cf"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  user_data = file("${path.module}/app1-install.sh")  #file module available in terra to cal userdata path
  tags = {
    "Name" = "EC2 Demo"
  }
}