terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-magdy-2024"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-magdy"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}
