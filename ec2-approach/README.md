# Procode EC2 WebApp – Terraform Deployment

This repository contains a Terraform configuration to deploy a simple NGINX-based web application on an Amazon EC2 instance. The infrastructure includes networking, security, and an EC2 instance running NGINX, fully automated using Terraform.

---

## Architecture

The infrastructure deployed includes:

1. **VPC and Networking**
   - A single VPC with CIDR 10.0.0.0/16
   - Two public subnets
   - Internet Gateway and public route table
   - Security Group allowing:
   - HTTP (port 80) only from your IP (as per the interview task)


2.  **EC2 Instance**
    - EC2 instance running Amazon Linux 2
    - User data installs and starts NGINX
    - Instance is created in a public subnet
    - Elastic IP attached to access the server

3.  **Terraform Backend**
    - State is stored in an S3 bucket
    - DynamoDB table is used for state locking

Note:
The S3 bucket and DynamoDB table were manually created before running Terraform.

---

## Prerequisites

- AWS CLI configured with valid credentials
- Terraform installed (v1.3+ recommended)
- AWS account with permissions to create:
  - VPC, Subnets, Security Groups
  - EC2 Instances and IAM Roles
  - S3 Bucket + DynamoDB (for remote state)

---
### Backend Configuration

- Terraform remote state is stored in an S3 bucket and uses a DynamoDB table for state locking.
- **Note:** The S3 bucket and DynamoDB table were manually created prior to running Terraform.

---

## How to Deploy

1. **Clone the repository**
```bash
git clone https://github.com/siddharthk6-tech/procode-interview-task.git
cd procode-interview-task
cd ecs-approach
```

2. **Initialize Terraform**

```bash
terraform init
```

3. **Review the planned infrastructure**

```bash
terraform plan
```

4. **Apply the configuration**

```bash
terraform apply -auto-approve
```

---

## Outputs

After deployment, Terraform prints:

ec2_public_ip → Use this IP to access the NGINX page

vpc_id

subnet_ids

security_group_id

---

## Testing the Deployment

Visit the alb_dns_name in your browser.

You should see the NGINX welcome page indicating the container is running successfully.

---

## Clean Up

To destroy all resources created by Terraform:

```bash 
terraform destroy -auto-approve
```
