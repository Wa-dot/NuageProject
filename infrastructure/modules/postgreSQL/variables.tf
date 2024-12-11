variable "postgresql_server_name" {
    description = "Name given to the postgresql server"
    type = string
}

variable "rg_name" {
    description = "Name of the resource group in Azure"
    type = string
}

variable "physical_loc" {
    description = "Location of the Azure resources"
    type = string
}

variable "delegated_subnet_id" {
    description = "ID of the delegated sub network for the PostgreSQL Flexible Server"
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









