variable "rg_name" {
  description = "Name of resource group"
  default     = "RG_for_dynamic_resources"
  type        = string
}

variable "rg_location" {
  description = "Location of resource group"
  default     = "westeurope"
  type        = string
}

variable "vnet_name" {
  description = "Name of virtual network"
  default     = "VN_for_dynamic_resources"
  type        = string
}

variable "vnet_adress" {
  description = "Virtual network adress space"
  default     = ["10.0.0.0/16"]
  type        = list(string)
}

variable "subnets" {
  description = "Name of the subnets"
  type = map(object({
    name          = string
    address_space = list(string)
  }))
}