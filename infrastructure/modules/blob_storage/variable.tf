variable "storage_account_name" {
  type        = string
  description = "Nom du compte de stockage"
}

variable "resource_group_name" {
  type        = string
  description = "Nom du groupe de ressources"
}

variable "subnet_id" {
  type        = string
  description = "ID du subnet pour les règles réseau"
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