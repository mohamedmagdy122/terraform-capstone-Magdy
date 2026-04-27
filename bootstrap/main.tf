provider "aws" {
  region = "us-east-1"
}

# S3 Bucket for storing Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket        = "terraform-state-magdy-2024"
  force_destroy = true

  tags = {
    Name = "terraform-state-magdy-2024"
  }
}

# Enable versioning on S3 bucket
resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB Table for state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock-magdy"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "terraform-lock-magdy"
  }
}

# Outputs
output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_lock.name
}
