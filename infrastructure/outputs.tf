## Resource group, all following outputs are fetched from the resource group module

# Outputs the ID of the resource group

output "resource_group_id" {
  description = "Resource group ID"
  value = module.resource_group.resource_group_id
}

# Outputs the name of the resource group
output "resource_group_name" {
  description = "Resource group name"
  value       = module.resource_group.resource_group_name
}

# Outputs the physical location of the resource group
output "location" {
  description = "Resource group and modules physical location"
  value       = module.resource_group.location
}

## Virtual network, all following outputs are fetched from the virtual network module

# Outputs ID of the virtual network
output "virtual_network_id" {
  description = "Virtual network ID"
  value       = module.virtual_network.virtual_network_id
}

# Outputs the name of the virtual network
output "virtual_network_name" {
  description = "Virtual network name"
  value       = module.virtual_network.virtual_network_name
}

# Outputs information about subnets in the virtual network
output "subnets" {
  description = "Subnets"
  value = module.virtual_network.subnet_ids
}

## PostgreSQL, all following ouputs are fetched from the postgresql module

# Outputs the ID of the DNS private zone for PostgreSQL
output "dns_private_zone_id" {
  description = "ID of the dns private zone"
  value       = module.postgresql.dns_private_zone_id
}

# Outputs the FQDN of the PostgreSQL server
output "postgresql_server_fqdn" {
  description = "Complete DNS name of the PostgreSQL server"
  value       = module.postgresql.postgresql_server_fqdn
}

# Outputs the unique ID of the PostgreSQL Flexible Server
output "postgresql_server_id" {
  description = "Unique ID of the PostgreSQL Flexible server"
  value       = module.postgresql.postgresql_server_id
}


## App service, all following outputs are fetched from the app-service module

# Outputs the ID of the Linux Web App (App Service)
output "app_id" {
  description = "ID of the Linux Web App"
  value       = module.app_service.app_id 
}

## Blob storage, all following outputs are fetched from the blob storage module

# Outputs of the ID of the Azure Storage Account
output "storage_account_id" {
  description = "ID of the Azure Storage Account"
  value       = module.blob_storage.storage_account_id
}

# Outputs the name of the Azure Storage Account
output "storage_account_name" {
  description = "Name of the storage account"
  value       = module.blob_storage.storage_account_name
}

# Outputs the ID of the Azure Storage Container
output "storage_container_id" {
  description = "L'ID du conteneur de stockage Azure."
  value       = module.blob_storage.storage_container_id
}

# Outputs the name of the Azure Storage Container
output "storage_container_name" {
  description = "Name of the container"
  value       = module.blob_storage.storage_container_name
}

# Outputs the name of the blob in the storage container
output "storage_blob_name" {
  description = "Name of the blob storage"
  value       = module.blob_storage.storage_blob_name
}

# Outputs the URL for accessing the blob storage
output "storage_blob_url" {
  description = "Storage url"
  value       = module.blob_storage.storage_blob_url
}