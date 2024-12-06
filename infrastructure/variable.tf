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

#Virtual Network
variable "network_name" {
  description = "Nom du réseau virtuel"
  type        = string
}

variable "address_space" {
  description = "Adresses IP autorisées dans le réseau virtuel"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

#App Service
variable "service_plan_name" {
  description = "Name of the service plan"
  type        = string
}

variable "web_app_name" {
  description = "value"
  type        = string
}

#Gateway
variable "gateway_name" {
    description = "Name of the gateway"
    type = string  
}

#PostgreSQL
variable "postgresql_server_name" {
    description = "Name given to the postgresql server"
    type = string
}

variable "admin_username" {
    description = "Username of the administrator of the PostgreSQL"
    type = string
}

variable "admin_password" {
    description = "Secured password of the PostgreSQL administrator"
    type = string
    sensitive = true
}

variable "db_name" {
    description = "Name given to the created database"
    type = string
}

variable "sku_name" {
    description = "SKU name"
    type = string
}

variable "storage_mb" {
    description = "Storage capacity for PostgreSQL in Mo"
    type = number
}

variable "db_version" {
    description = "Version of the PostgreSQL server"
    type = string
}