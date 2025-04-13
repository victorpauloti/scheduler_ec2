terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.79"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "pronto"
  region  = var.region
}