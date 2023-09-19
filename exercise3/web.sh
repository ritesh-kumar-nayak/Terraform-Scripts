#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install apache2 -y  # Added "-y" to automatically confirm installation
sudo systemctl start apache2
sudo systemctl enable apache2
wget https://www.tooplate.com/download/2136_kool_form_pack
unzip -o 2136_kool_form_pack.zip  # Corrected the ZIP file name
sudo cp -r 2136_kool_form_pack/* /var/www/html/
sudo systemctl restart apache2
