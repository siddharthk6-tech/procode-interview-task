terraform {
  backend "s3" {
    bucket         = "procode-task-tf-bucket-ec2"
    key            = "terraform-ec2-webapp/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

