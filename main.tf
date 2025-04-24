
provider "aws" {
  region = "us-east-1"
}

module "ecs_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"
  name   = "ecs-instance"
  ami    = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ecs_sg.id]
  subnet_id = aws_subnet.public.id
  user_data = file("ecs-userdata.sh")
}
