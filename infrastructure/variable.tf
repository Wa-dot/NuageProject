variable "resource_group_name" {
  type        = string
  description = "Nom du groupe de ressources"
  default     = "rg_nuage_project"  # Convention de nommage: rg-[nom-projet]
}

variable "storage_account_name" {
  type        = string
  description = "Nom du compte de stockage"
  default     = "stnuageproject"    # Doit être unique et en minuscules, sans caractères spéciaux
}

variable "location" {
  type        = string
  description = "Localisation Azure"
  default     = "francecentral" 
}

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