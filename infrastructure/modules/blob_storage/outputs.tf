output "storage_account_id" {
    value       = azurerm_storage_account.blob_storage.id
    description = "value of the storage account id"
}

output "storage_account_name" {
    value       = azurerm_storage_account.blob_storage.name
    description = "value of the storage account name"
}

output "storage_container_id" {
    value       = azurerm_storage_container.storage_container.id
    description = "value of the storage container id"
}

output "container_name" {
    value       = azurerm_storage_container.storage_container.name
    description = "value of the storage container name"
}

output "storage_blob_name" {
    value       = azurerm_storage_blob.storage_blob.name
    description = "value of the storage blob name"
}

output "storage_blob_url" {
    value       = azurerm_storage_account.blob_storage.primary_blob_endpoint
    description = "value of the storage blob url"
}