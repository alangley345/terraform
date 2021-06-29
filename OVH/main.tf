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
  pm_api_url = "https://proxmox.greatcatlab.net:8006/api2/json"
  region = "us=east-1"
}