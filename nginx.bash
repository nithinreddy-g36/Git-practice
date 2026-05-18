#!/bin/bash
#Purpose - To Install nginx on ec2 server.
#Owner - Nithin Reddy
#Modification Dat - 15/05/2026

#!/bin/bash
#!/bin/bash

sudo yum update -y

sudo yum install nginx -y

sudo systemctl start nginx

sudo systemctl enable nginx

sudo systemctl status nginx

echo "Nginx Installed Successfully"


