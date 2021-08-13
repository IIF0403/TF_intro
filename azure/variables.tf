
variable "rg_name" {
  description = "Name of resource group"
  default     = "first_resource_group"
  type        = string
}

variable "rg_location" {
  description = "Location of resource group"
  default     = "westeurope"
  type        = string
}

variable "vnet_name" {
  description = "Name of virtual network"
  default     = "first_viritual_network"
  type        = string
}

variable "vnet_adress" {
  description = "Virtual network adress space"
  default     = ["10.0.0.0/16"]
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of subnet"
  default     = "first_subnet"
  type        = string
}
