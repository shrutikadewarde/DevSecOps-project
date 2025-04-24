provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "dev-s3-bucket-mum"
    key            = "terraform/state"
    region         = "ap-south-1"
    dynamodb_table = "devsecops-dynamodb-table"
  }
}