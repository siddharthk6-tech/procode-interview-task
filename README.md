# Procode Cloud – Terraform Practical Assessment

This repository contains my complete solution for the Procode Cloud Terraform technical assessment.
The task has been implemented using two separate approaches, both fully functional and deployed on AWS:

## Approach 1 — ECS Fargate (Containerized Web App)

A fully serverless container-based solution using:

* AWS ECS on Fargate
* Application Load Balancer
* VPC, Subnets, Security Groups
* IAM roles
* NGINX container
* Restricted IP access
* Remote backend using S3 + DynamoDB

Directory: [ecs-approach](https://github.com/siddharthk6-tech/procode-interview-task/tree/main/ecs-approach)

## Approach 2 — EC2 with ALB (Nginx Web Server on EC2)

A compute-based solution using:

* EC2 instance running NGINX via user-data
* Application Load Balancer
* VPC, Subnets, IGW, Route tables
* Security groups
* Remote backend using S3 + DynamoDB
* Restricted IP access

Directory: [ec2-approach](https://github.com/siddharthk6-tech/procode-interview-task/tree/main/ec2-approach)

---
## Proofs

Screenshots proving successful deployments have been uploaded in proofs directory of each approach.

---

Each approach has its own README explaining:

* Assumptions
* Commands to run
* Output details
* Testing instructions

---

## Running Instructions

Both approaches support:
```bash
terraform init
terraform apply -auto-approve
```

Each approach outputs an ALB DNS name to test the web app.






