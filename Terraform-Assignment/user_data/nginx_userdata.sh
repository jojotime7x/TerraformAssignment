#!/bin/bash
# Update system packages
sudo yum update -y

# Install Nginx
sudo amazon-linux-extras install nginx1 -y

# Create a custom HTML file
cat <<EOF | sudo tee /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Terraform Assignment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #0066cc;
        }
        h2 {
            color: #0044cc;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Terraform Assignment</h1>
        <h2>Nginx Server running on EC2</h2>
        <p>This page is served by Nginx running on an AWS EC2 instance, provisioned using Terraform.</p>
    </div>
</body>
</html>

EOF

# Backup the default Nginx config
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup


# Restart Nginx to apply the changes
sudo systemctl restart nginx
sudo systemctl enable nginx
