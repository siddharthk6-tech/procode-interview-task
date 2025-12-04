output "ecs_cluster_name" {
  value = aws_ecs_cluster.cluster.name
}

output "ecs_service_name" {
  value = aws_ecs_service.web.name
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = [aws_subnet.public1.id, aws_subnet.public2.id]
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}

output "alb_dns_name" {
  value = aws_lb.web_alb.dns_name
}

