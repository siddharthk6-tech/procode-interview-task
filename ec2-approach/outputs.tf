output "alb_url" {
  description = "HTTP URL for the ALB"
  value       = "http://${aws_lb.web_alb.dns_name}"
}

output "ec2_instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "ec2_instance_id" {
  value = aws_instance.web.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = [aws_subnet.public1.id, aws_subnet.public2.id]
}

output "security_group_ids" {
  value = [aws_security_group.alb_sg.id, aws_security_group.ec2_sg.id]
}

