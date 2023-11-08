provider "aws" {
  region = "us-east-1" #Norte Virginia
}

#USO DE CHAVE JA ARMAZENADA LOCALMENTE
#resource "aws_key_pair" "sonar_key" {
#  key_name   = "mg-pessoal" # Nome da chave
#  #public_key = file("mg-pessoal.pem") # Caminho para a chave pública na local
#}
 
resource "aws_instance" "Sonarqube" {
  ami                    = "ami-06aa3f7caf3a30282" # AMI gratuita do Ubuntu
  instance_type          = "t2.medium" #2vCPU - 8gb RAM
  user_data              = file("sonar_script.sh")
  vpc_security_group_ids = [aws_security_group.ec2.id]
  key_name               = "<CHAVE_AWS>"#CHAVE CRIADA VIA AWS
  #key_name               = aws_key_pair.sonar_key.key_name # Usa a chave criada localmente

  tags = {
    Name = "Sonarqube"
    Managed_by = "Terraform"
  }
}


##DAQUI PRA BAIXO APANAS CONFIGURAR SE FOR UTILIZAR ROUTE53 e um DOMINIO PERSONALIZADO

#data "aws_route53_zone" "selected" {
#  name         = "nome-dominio-aws"
#  private_zone = false
#}

#resource "aws_route53_record" "domainName" {
#  name    = "sonar"
#  type    = "A"
#  zone_id = data.aws_route53_zone.selected.zone_id
#  records = [aws_instance.Sonarqube.public_ip]
#  ttl     = 300
#  depends_on = [
#    aws_instance.Sonarqube
#  ]
#}