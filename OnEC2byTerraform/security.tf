resource "aws_security_group" "ec2" {
  name        = "allow_sonar"
  description = "Allow sonar outbound traffic"
  vpc_id = "<VPC_ID>" #PEGAR VPC ID NO CONSOLE

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  #NO USO DE DOMINIO PERSONALIZAD CRIAR ingress para as portas 80 e 443

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_sonar"
    Managed_by = "Terraform"
  }
}