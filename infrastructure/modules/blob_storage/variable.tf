variable "storage_account_name" {
  type        = string
  description = "Nom du compte de stockage"
}

variable "resource_group_name" {
  type        = string
  description = "Nom du groupe de ressources"
}

variable "location" {
  type        = string
  description = "Localisation des ressources"
}

variable "subnet_id" {
  type        = string
  description = "ID du subnet pour les règles réseau"
}