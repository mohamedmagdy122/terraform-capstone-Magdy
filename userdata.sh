#!/bin/bash
yum update -y
yum install -y httpd unzip wget
systemctl start httpd
systemctl enable httpd
cd /tmp
wget https://www.tooplate.com/zip-templates/2134_gotto_job.zip
unzip -o 2134_gotto_job.zip
cp -r 2134_gotto_job/* /var/www/html/
systemctl restart httpd
