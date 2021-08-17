terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 0.14.9"
}

provider "azurerm" {
  subscription_id = "dfc70de2-a519-4f23-a89b-b3672d39817e"
  features {}
}

resource "azurerm_resource_group" "rg_1" {
  name     = var.rg_name
  location = var.rg_location
}

resource "azurerm_virtual_network" "vnet_1" {
  name                = var.vnet_name
  address_space       = var.vnet_adress
  location            = azurerm_resource_group.rg_1.location
  resource_group_name = azurerm_resource_group.rg_1.name
}

resource "azurerm_subnet" "subnet_1" {
  for_each             = var.subnets
  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.rg_1.name
  virtual_network_name = azurerm_virtual_network.vnet_1.name
  address_prefixes     = each.value.address_space
}