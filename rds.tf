resource "aws_db_subnet_group" "main" {
  name       = "floci-db-subnet-group"
  subnet_ids = [aws_subnet.main.id]
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t2.micro"
  db_name                 = "testdb"
  username             = "admin"
  password             = "password"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}