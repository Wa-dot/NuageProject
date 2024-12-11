output "storage_account_id" {
  value       = azurerm_storage_account.storage_account.id
  description = "Value of the storage account ID"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage_account.name
  description = "Value of the storage account name"
}

output "storage_container_id" {
  value       = azurerm_storage_container.storage_container.id
  description = "Value of the storage container ID"
}

output "storage_container_name" {
  value       = azurerm_storage_container.storage_container.name
  description = "Value of the storage container name"
}

output "storage_blob_name" {
  value       = azurerm_storage_blob.storage_blob.name
  description = "Value of the storage blob name"
}

output "storage_blob_url" {
  value       = azurerm_storage_blob.storage_blob.url
  description = "Value of the storage blob URL"
}