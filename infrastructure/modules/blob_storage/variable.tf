variable "blob_storage_name" {
    type        = string
    description = "Blob storage name in Microsoft Azure"
}

variable "resource_group_name" {
    type        = string
    description = "Resource group name in Microsoft Azure"
}

variable "type" {
    type        = string
    description = "Type of blob storage"
    default     = "Standard_LRS"
}

variable "storage_container_name" {
    type        = string
    description = "Storage container name in Microsoft Azure"
}

variable "location" {
    type        = string
    description = "Location in Microsoft Azure"
    default     = "West Europe"
}