terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.1"
    }
  }
}

provider "proxmox" {
  # Configuration options
}

#define location of state file
terraform {
  backend "s3" {
    bucket = "myterraformcode"
    key    = "aws-dev-infrastructure/terraform.tfstate"
    region = "us-east-1"
  }
}