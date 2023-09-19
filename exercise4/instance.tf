# Here all the variables and other details will be implemented and from here only the instance will be created

resource "aws_instance" "InstanceByTerraform" {
    ami = var.AMIS[var.REGION]
    instance_type = var.INSTANCETYPE
    availability_zone = var.ZONE1
    vpc_security_group_ids = [ "sg-0023c53bf1348d108" ]
    key_name = "instanceBy_terraform"
    
    tags = {
        Name = "InstanceByTerraform"
        Project = "Terraform_Pract"
        
    }
    
    provisioner "local-exec" {
        command = "echo aws_instance.InstanceByTerraform.private_ip >> privateIPs.txt"
    }
  
}


 # Implementing output concept and printing the required information in the console

output "public_ip" {
    value = aws_instance.InstanceByTerraform.public_ip
  
}

output "PrivateIP" {
    value = aws_instance.InstanceByTerraform.private_ip
  
}

