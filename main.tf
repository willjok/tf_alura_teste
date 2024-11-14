terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
   ami           = "ami-0182f373e66f89c85"
   instance_type = "t2.micro"
   key_name = "iac-alura"
   user_data = <<EOF
                #!/bin/bash
            cd "/home/ec2-user"
	    touch /tmp/teste/.txt	
            echo "<h1>Feito com Terraform</h1>" > index.html
                 EOF

  tags = {
    Name = "Terceira_Instancia"
  }
}
