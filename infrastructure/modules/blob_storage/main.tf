resource "random_string" "name" {
  length  = 8
  special = false
}

# Correction : azurerm_storage_account au lieu de azurerm_blob_storage
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier            = "Standard"
  account_replication_type = "LRS"  # Correction : account_replication_type au lieu de account_replication
  
  network_rules {
    default_action             = "Allow"
    virtual_network_subnet_ids = [var.subnet_id]
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "api"
  storage_account_name  = azurerm_storage_account.storage_account.name  # Correction : storage_account_name au lieu de storage_account_id
  container_access_type = "private"
  depends_on           = [azurerm_storage_account.storage_account]  # Correction : référence correcte
}

resource "azurerm_storage_blob" "storage_blob" {
  name                   = "product.json"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
  source                 = "${path.module}/product.json"  # Correction : correction du chemin
  depends_on            = [azurerm_storage_container.storage_container]
}