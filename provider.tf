terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.58.0"
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