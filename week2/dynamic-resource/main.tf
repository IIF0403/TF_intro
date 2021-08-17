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

module "module_one" {
    source = ".//module1"
    rg_name = "RG_for_dynamic_resources"
    vnet_name = "VN_for_dynamic_resources"
    vnet_adress = ["10.0.0.0/16"]
    subnets = {
        "subnet1" = {
            name = "sub1"
            address_space = ["10.0.1.0/24"]
        }
        "subnet2" = {
            name = "sub2"
            address_space = ["10.0.2.0/24"]
        }
        "subnet3" = {
            name = "sub3"
            address_space = ["10.0.3.0/24"]
        }
        "subnet4" = {
            name = "sub4"
            address_space = ["10.0.4.0/24"]
        }
        "subnet5" = {
            name = "sub5"
            address_space = ["10.0.5.0/24"]
        }
    }
}

#command: terraform apply -target=module.module_one