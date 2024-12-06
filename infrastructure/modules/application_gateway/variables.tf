variable "rg_name" {
    description=" Name of the resource group in Azure"
    type = string
}

variable "physical_loc" {
    description = "Location of the Azure resources"
    type = string
}

variable "gateway_name" {
    description = "Name of the gateway"
    type = string  
}

variable "subnet_id" {
  description = "Subnet id"
  type = string
}

variable "app_service_fqdn" {
  description = "App service FQDN"
  type = string
}