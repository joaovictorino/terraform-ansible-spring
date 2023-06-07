terraform {
  required_version = ">= 0.13"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.25.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "random_string" "random_rg" {
  length  = 4
  upper   = false
  special = false
}

resource "azurerm_resource_group" "rg_aula" {
  name     = "myResourceGroup${random_string.random_rg.result}"
  location = var.location

  tags = {
    environment = "aula infra"
  }
}