provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    # REPLACE BELOW
    bucket = "bucketkenz"     # <-- replace
    key    = "secure-eks-cluster/terraform.tfstate"
    region = "us-east-1"
  }
}
