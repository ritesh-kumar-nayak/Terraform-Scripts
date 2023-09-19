variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map
  default = {
    
    us-east-1= "ami-04cb4ca688797756f"
    us-east-2 = "ami-024e6efaf93d85776"

  }
}

variable "INSTANCETYPE" {
  default = "t2.micro"
}