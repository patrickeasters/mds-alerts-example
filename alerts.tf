terraform {
  required_providers {
    sysdig = {
      source = "sysdiglabs/sysdig"
    }
  }
  backend "s3" {}
  required_version = ">= 1.2"
}

variable "sysdig_monitor_api_token" {}

provider "sysdig" {
  sysdig_monitor_url = "https://us2.app.sysdig.com"
  sysdig_monitor_api_token = var.sysdig_monitor_api_token
}

module "sysdig_primary" {
    source = "./alerts"
}

