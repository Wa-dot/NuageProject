## General - provider

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
  sensitive   = true
}

#Resource Group
variable "resource_group_name" {
  type        = string
  description = "Nom du groupe de ressources"
  default     = "rg_nuage_project"  # Convention de nommage: rg-[nom-projet]
}

variable "storage_account_name" {
  type        = string
  description = "Name of storage account"
  default     = "stnuageproject"    # Doit être unique et en minuscules, sans caractères spéciaux
}

variable "location" {                   #Pas nécessaire mais nous avons choisi de la renseigner
  type        = string
  description = "Localisation Azure"
  default     = "Central France"
}



#Blob Storage
variable "blob_storage_name" {
    type        = string
    description = "Blob storage name in Microsoft Azure"
}

variable "type" {
    type        = string
    description = "Type of blob storage"
    default     = "Standard_LRS"
}

variable "storage_account_name" {
  type        = string
  description = "Nom du compte de stockage"
}