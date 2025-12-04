variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "app_name" {
  description = "Application name prefix"
  type        = string
  default     = "procode-ec2-webapp"
}

variable "allowed_ip" {
  description = "Your public IP (CIDR) allowed to access ALB (e.g. 82.4.231.71/32)"
  type        = string
  default     = "82.4.231.71/32"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Optional EC2 key pair name for SSH access. Leave empty if not needed."
  type        = string
  default     = ""
}

