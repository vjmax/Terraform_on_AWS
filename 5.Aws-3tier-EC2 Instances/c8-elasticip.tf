# Create Elastic IP for Bastion Host
# Resource - depends_on Meta-Argument
resource "aws_eip" "bastion_eip" {
  depends_on = [ module.ec2_public, module.vpc ] #after crt pub ec2 & vpc module elp will started
  instance = module.ec2_public.id[0]
  vpc      = true
  tags = local.common_tags

## Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner - Triggered during deletion of Resource)
  provisioner "local-exec" {
    command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
    #on_failure = continue
  }  
}

#destroy panura time ah destroy-time-prov.txt nu oru file la save panum path :local-exec-output-files
#itha null resource anga mention pana mudiyathu bcz destroy not acc in null so itha enganalum podukalam