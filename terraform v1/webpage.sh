#!/bin/bash
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "welcome to devops" > /var/www/html/index.html
