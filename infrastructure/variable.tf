variable "resource_group_name" {
  type        = string
  description = "Projet Nuage"
}

variable "location" {
  type        = string
  description = "Localisation Azure"
  default     = "West Europe"
}

variable "storage_account_name" {
  type        = string
  description = "Nom du compte de stockage"
}