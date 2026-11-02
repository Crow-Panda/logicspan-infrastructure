terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "logicspan-finops-dev-123" # We will update this with your real GCP project ID later
  region  = "europe-west2"
  
  default_labels = {
    environment = "dev"
    cost-centre = "engineering"
    managed-by  = "terraform"
  }
}

module "vpc" {
  source = "../../modules/network"
}
module "storage" {
  source = "../../modules/storage"
}