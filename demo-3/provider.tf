terraform {
  required_version = ">= 1.0.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.9.0"
      
    }
    
  }
}

provider "aws" {
      access_key = "${var.AWS_ACCESS_KEY}"
      secret_key = "${var.AWS_SECRET_KEY}"
      region = "${var.AWS_REGION}"

}

