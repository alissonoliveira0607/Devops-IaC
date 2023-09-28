# Este é um arquivo de configuração Terraform que provisiona uma instância AWS.

# Definindo o provedor AWS que será usado para provisionar recursos.
provider "aws" {
  # O perfil AWS a ser usado para autenticação.
  profile = "default"

  # A região AWS onde os recursos serão criados.
  region = "us-east-1"
}


# Definindo um recurso AWS: uma instância EC2.
resource "aws_instance" "app_server" {
  # A ID da AMI que será usada para criar a instância.
  ami = "ami-053b0d53c279acc90"

  # O tipo de instância EC2.
  instance_type = "t2.micro"

  # DEFININDO O PAR DE CHAVES PRIVADA
  key_name = "devops"
  
  # Definindo o comando a ser executado no provisionamento
#   user_data = <<-EOF
#         #!/bin/bash
#         cd /home/ubuntu
#         echo "<h1> Criado com o Terraform </h1>" > index.html
#         nohup busybox httpd -f -p 8080 &
#                 EOF
 
  # Definindo tags para a instância, incluindo o nome.
  tags = {
    Name = "Stack-Devops"
  }
}

