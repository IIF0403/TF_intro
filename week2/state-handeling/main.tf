#Task 1 week 2: Deploy a resource in the portal and import it to the state

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
  subscription_id = "" 
  features {}
}

#Have deployed a resource group named "RG_to_import" in the portal

#Terraform configuration built for the resource
resource "azurerm_resource_group" "rg_1"{
    name = "RG_to_import"
    location = "westeurope"
}

#Terraform import command: terraform import <Terraform resource name>.<resource label>.<Azure resource ID>

#Find the ID of the resource created in the portal with command: az group show --name RG_to_import

#Terraform import command: terraform import azurerm_resource_group.rg_1 /subscriptions/dfc70de2-a519-4f23-a89b-b3672d39817e/resourceGroups/RG_to_import



