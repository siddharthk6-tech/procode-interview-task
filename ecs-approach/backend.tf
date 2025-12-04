terraform {
  backend "s3" {
    bucket         = "procode-task-tf-bucket-12345"
    key            = "terraform-ecs-webapp/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

