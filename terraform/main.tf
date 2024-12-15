terraform {
  required_version = ">= 1.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0, < 7"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.60.0, < 7"
    }
  }
  # backend "gcs" {
  #   bucket = "cg-stg-gcp-terraform-state-yang"
  #   prefix = "terraform/state-files"
  # }
}



# provider "google" {
#   #credentials = file(var.gcp_credentials_file_path)

#   # Should be able to parse project from credentials file but cannot.
#   # Cannot convert string to map and cannot interpolate within variables.
#   project = var.gcp_project_id

#   region = var.gcp_region
# }

provider "aws" {
  region     = "us-east-1"
}
