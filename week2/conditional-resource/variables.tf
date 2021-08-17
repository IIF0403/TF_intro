variable "rg_name" {
  description = "Name of resource group"
  default     = "RG_for_conditional_resource"
  type        = string
}

variable "rg_location" {
  description = "Location of resource group"
  default     = "westeurope"
  type        = string
}

variable "vnet_name" {
  description = "Name of virtual network"
  default     = "VN_for_conditional_resource"
  type        = string
}

variable "vnet_adress" {
  description = "Virtual network adress space"
  default     = ["10.0.0.0/16"]
  type        = list(string)
}

variable "deploy_subnet" {
  description = "If set to Yes the subnet is deployed"
  type        = string
}
variable "subnet_name" {
  description = "Name of subnet"
  default     = "The_subnet"
  type        = string
}

variable "subnet_adress" {
  description = "Subnet adress prefixes"
  default     = ["10.0.1.0/24"]
  type        = list(string)
}

