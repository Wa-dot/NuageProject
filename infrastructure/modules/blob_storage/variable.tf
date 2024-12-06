variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Physical location of the resource group"
}

variable "blob_storage_name" {
  type        = string
  description = "Blob storage name in Microsoft Azure"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet"
}

variable "type" {
    type        = string
    description = "Type of blob storage"
}