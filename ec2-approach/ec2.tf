# Fetch latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# EC2 Instance with user-data to install nginx
resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true
  key_name               = var.key_name != "" ? var.key_name : null
  tags = { Name = "${var.app_name}-instance" }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y nginx1
              systemctl enable nginx
              systemctl start nginx
              # Simple index.html (optional)
              cat > /usr/share/nginx/html/index.html <<'HTML'
              <html><head><title>Procode EC2 NGINX</title></head>
              <body><h1>Welcome to NGINX on EC2!</h1>
              <p>Deployed via Terraform (ec2-solution).</p></body></html>
              HTML
              EOF
}

# Register instance with target group (so ALB sees it)
resource "aws_lb_target_group_attachment" "web_attach" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.web.id
  port             = 80
}

