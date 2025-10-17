terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>4.49.0"
    }
  }
  required_version = ">=1.9.0"
}

provider "azurerm" {
  features {}

  subscription_id = "1886c257-00c2-4dcf-a8b9-1a7c9b2be998"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "North Central US"
}

resource "azurerm_storage_account" "example" {

  name                     = "terraformstarthln01"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}