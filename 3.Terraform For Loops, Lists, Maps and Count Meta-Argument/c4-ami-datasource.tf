data "aws_ami" "ubuntu" {
  most_recent = true   
  owners = [ "099720109477" ] #from ami console 
  filter {
    name = "name"
    values = [ "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*" ] ##from ami console
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]           #from lanuch instance console
  }
  filter {
    name = "architecture"        
    values = [ "x86_64" ]       ##from lanuch instance console
  }
} 
