# Procode EC2 WebApp – Terraform Deployment

This repository contains a **Terraform configuration** that deploys a single **EC2 instance** running NGINX, fronted by an Application Load Balancer (ALB). The infrastructure includes networking components, security groups and load balanced EC2 instance serving NGINX.

---

## Architecture

The infrastructure deployed includes:

1. **VPC and Networking**
   - A single VPC with CIDR 10.0.0.0/16
   - Two public subnets
   - Internet Gateway and public route table

2. **Security**
   - ALB Security Group
     * Allows HTTP (80) from your specified IP only
   - EC2 Security Group
     * Allows HTTP (80) only from the ALB security group (not from the public)
  
3. **Load Balancer**
   - Application Load Balancer in public subnets
   - Target Group with health checks
   - Listener on port 80
   - EC2 instance automatically registered to the target group

4.  **EC2 Instance**
    - EC2 instance running Amazon Linux 2
    - User data installs and starts NGINX
    - Instance sits behind the ALB (not accessible directly)

5.  **Terraform Backend**
    - State is stored in an S3 bucket
    - DynamoDB table is used for state locking

---

## Prerequisites

- AWS CLI configured with valid credentials
- Terraform installed 
- AWS account with permissions to create:
  - VPC, Subnets, Security Groups
  - Application Load Balancer (ALB)
  - EC2 Instances and IAM Roles
  - S3 Bucket + DynamoDB

---
### Backend Configuration

- Terraform remote state is stored in an S3 bucket and uses a DynamoDB table for state locking.
- The S3 bucket and DynamoDB table were manually created prior to running Terraform.

---

## How to Deploy

1. **Clone the repository**
```bash
git clone https://github.com/siddharthk6-tech/procode-interview-task.git
cd procode-interview-task
cd ec2-approach
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
                    
 **alb_dns_name** → [Access the web application using this ALB DNS.](https://github.com/siddharthk6-tech/procode-interview-task/blob/main/ec2-approach/proofs-ec2/alb-showing-nginx_page.png)

 **ec2_instance_id** → [The EC2 instance ID created](https://github.com/siddharthk6-tech/procode-interview-task/blob/main/ec2-approach/proofs-ec2/ec2_instance-name.png) 
 
 **alb_security_group_id** → [Security Group of ALB](https://github.com/siddharthk6-tech/procode-interview-task/blob/main/ec2-approach/proofs-ec2/tf-apply-output.png)
 
 **ec2_security_group_id** → [Security Group of EC2](https://github.com/siddharthk6-tech/procode-interview-task/blob/main/ec2-approach/proofs-ec2/tf-apply-output.png)
 
 **vpc_id** → [VPC IDs](https://github.com/siddharthk6-tech/procode-interview-task/blob/main/ec2-approach/proofs-ec2/tf-apply-output.png)     
 **subnet_ids** → [List of Public Subnets](https://github.com/siddharthk6-tech/procode-interview-task/blob/main/ec2-approach/proofs-ec2/tf-apply-output.png)      


---

## Testing the Deployment

Visit the alb_dns_name in your browser.

You should see the **NGINX Welcome Page** indicating the container is running successfully.

---

## Clean Up

To destroy all resources created by Terraform:

```bash 
terraform destroy -auto-approve
```





