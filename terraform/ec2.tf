data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "secure_bastion" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.ec2_instance_type
  key_name                    = var.ec2_key_name  # ✅ REPLACE with your actual key name
    subnet_id                   = aws_subnet.public_subnet.id       # ✅ NEW
  vpc_security_group_ids      = [aws_security_group.ssh_access.id] # ✅ NEW
  associate_public_ip_address = true

  tags = {
    Name = "SecureBastionEC2"
  }
}
