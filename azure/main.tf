# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"

  backend "remote" {
    organization = "sopratest-org"
    workspaces {
      name = "Example-Workspace2"
    }
  }
}

provider "azurerm" {
  subscription_id = ""
  features {}
}



resource "azurerm_resource_group" "rg_1" {
  name     = var.rg_name
  location = var.rg_location
  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet_1" {
  name                = var.vnet_name
  address_space       = var.vnet_adress
  location            = azurerm_resource_group.rg_1.location
  resource_group_name = azurerm_resource_group.rg_1.name
}

resource "azurerm_subnet" "subnet_1" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg_1.name
  virtual_network_name = azurerm_virtual_network.vnet_1.name
  address_prefixes     = ["10.0.1.0/24"]
}
