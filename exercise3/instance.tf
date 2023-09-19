resource "aws_key_pair" "demo_key" { # here demo_key is just the resource name but not the key name. Key name can be different. We give it just to refer the key
  key_name   = "apache_server_key"
  public_key = file("demo-key.pub") # here we are passing the file name and file function will read the content of the file and create the key accordingly

}

resource "aws_instance" "apache_instance" { # we can give any name instead of apache_instance

  ami                    = var.AMIS[var.REGION]
  instance_type          = var.INSTANCE_TYPE
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.demo_key.key_name
  vpc_security_group_ids = ["sg-0023c53bf1348d108"]
  tags = {
    Name    = "Apache Server"
    Project = "Host WebApp"
  }
  # UNTIL NOW, IT WILL JUST LUNCH THE INSTANCE WITH RESPECTIVE KEY, INSTANCE TYPE, SECURITY GROUP ETC...
  # BUT WE ALSO WANT TO PROVISION IT WITH OUR SHELL SCRIPT, HENCE WE'LL USE provisioners BELOW

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  connection {
    user        = var.USER
    private_key = file("demo-key") # sending the private key using file() function to the remote server so that terraform can use this with the user to login
    host        = self.public_ip                                     # fetching the public IP of the file of the lunched Instance using self function of terraform which will allow the user to know which server it should connect with

  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh"
      , "sudo /tmp/web.sh"
    ]

  }

}
