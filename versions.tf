terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    acme = {
      source  = "vancluever/acme"
      version = "2.26.0"
    }
  }
}


