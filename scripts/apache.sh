#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd

echo "<h1>Welcome to my Devops Page with the HELLO WORLD!!!!!! </h1> " > /var/www/html/index.html