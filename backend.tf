terraform {
  backend "s3" {
    bucket = "kwabena-3-tier-bucket"
    region = "us-east-1"
    key = "terraform/backend-new"
    
  }
}