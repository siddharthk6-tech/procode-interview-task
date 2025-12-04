variable "region" {
  default = "eu-west-1"
}

variable "allowed_ip" {
  description = "IP allowed to access the app"
  default     = "82.4.231.71/32"
}

variable "app_name" {
  default = "procode-webapp"
}

variable "container_image" {
  default = "nginx:latest"
}

