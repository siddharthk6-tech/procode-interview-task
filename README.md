📌 Procode Cloud – Terraform Practical Assessment

This repository contains my complete solution for the Procode Cloud Terraform technical assessment.
The task has been implemented using two separate approaches, both fully functional and deployed on AWS:

## Approach 1 — ECS Fargate (Containerized Web App)

A fully serverless container-based solution using:

AWS ECS on Fargate

Application Load Balancer

VPC, Subnets, Security Groups

IAM roles

NGINX container

Restricted IP access (Optional Bonus)

Remote backend using S3 + DynamoDB

📂 Directory: ecs-approach/

## Approach 2 — EC2 with ALB (Nginx Web Server on EC2)

A compute-based solution using:

EC2 instance running NGINX via user-data

Application Load Balancer

VPC, Subnets, IGW, Route tables

Security groups

Optional SSH access via key pair

Remote backend using S3 + DynamoDB

Restricted IP access (Bonus)

📂 Directory: ec2-approach/

📁 Proofs

Screenshots proving successful deployment and load balancer access are available in:

📂 proofs/

📖 Architecture Documentation

Each approach has its own README explaining:

Assumptions

Architecture

Flow

Commands to run

Output details

Testing instructions

🚀 Running Instructions

Both approaches support:

terraform init
terraform apply -auto-approve


Each approach outputs an ALB DNS name to test the web app.

📌 Bonus Features Implemented

Remote backend

IP-restricted public access

Documentation

📌 Tools & Technologies

Terraform

AWS ECS Fargate / EC2

AWS VPC Networking

S3 + DynamoDB

IAM

GitHub
