resource "random_string" "name" {
  length  = 8
  special = false
  lower   = true
  upper   = false
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "nuagestoracc${random_string.name.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [var.subnet_id]
  }
}
resource "azurerm_storage_container" "storage_container" {
  name                  = "api"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "storage_blob" {
  name                   = "product.json"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
  source                 = "${path.module}/product.json"
}