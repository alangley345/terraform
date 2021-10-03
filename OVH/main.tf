terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.8.0"
    }
  }  
}

provider "proxmox" {
  # Configuration options
  pm_api_url  = "https://proxmox.greatcatlab.net:8006/api2/json"
  pm_user     = var.PM_USER
  pm_password = var.PM_PASS
  pm_parallel = 1
}
