variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Example_instance"
}

variable "vpc_name" {
  description = "Value of the Name tag for vpc"
  type        = string
  default     = "first_vpc"
}
variable "subnet_name" {
  description = "Value of the Name tag for subnet"
  type        = string
  default     = "first_subnet"

}
