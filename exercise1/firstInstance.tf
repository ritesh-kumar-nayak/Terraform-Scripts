terraform{
    required_providers{
        aws={
            source = "hashicorp/aws"
        }
    }
}
provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "IntroInstance" {
  ami                    = "ami-04cb4ca688797756f"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "instanceBy_terraform"
  vpc_security_group_ids = ["sg-0023c53bf1348d108"]
  tags = {
    Name = "pract_instance"
    Project = "Demo"
  }
}
