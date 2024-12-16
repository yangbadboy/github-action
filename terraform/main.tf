terraform {
  required_version = ">= 1.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.29.0"
    }
  }
  # backend "gcs" {
  #   bucket = "cg-stg-gcp-terraform-state-yang"
  #   prefix = "terraform/state-files"
  # }
  backend "s3" {
    bucket         = "github-action-yang"       
    key            = "terraform/state-files/terraform.tfstate" 
    region         = "us-east-1"               
    dynamodb_table = "terraform-lock-table"     
    encrypt        = true                       
  }
}



provider "google" {
  #credentials = file(var.gcp_credentials_file_path)

  # Should be able to parse project from credentials file but cannot.
  # Cannot convert string to map and cannot interpolate within variables.
  project = "gamehub-stg1"

  region = "us-central1"
}

provider "aws" {
  region     = "us-east-1"
}
