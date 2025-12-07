variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "procode-ec2-webapp"
}

variable "allowed_ip" {
  description = "My public IP (CIDR) allowed to access ALB"
  type        = string
  default     = "82.4.231.71/32"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}


