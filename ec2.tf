resource "aws_instance" "web" {
  ami                    = "ami-123456"  # Floci não valida AMI real
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.main.id
  security_groups        = [aws_security_group.ec2_sg.name]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "floci-ec2-instance"
  }
}