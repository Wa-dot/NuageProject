resource "random_string" "name" {
    length                 = 8
    special                = false  
}

resource "azurerm_blob_storage" "blob_storage" {
    name                   = var.blob_storage_name
    resource_group_name    = var.resource_group_name
    location               = var.location
    account_tier           = "Standard"
    account_replication    = "LRS"
    
    network_rules {
        default_action     = "Allow"
        virtual_network_subnet_ids = [var.subnet_id]
    }
}

resource "azurerm_storage_container" "storage_container" {
    name                   = "api"
    storage_account_id     = azurerm_blob_storage.blob_storage.id
    container_access_type  = "private"
    depends_on             = [ azurerm_storage_account.storage_account ]
}

resource "azurerm_storage_blob" "storage_blob" {
    name                   = "product.json"
    storage_account_name   = azurerm_storage_account.storage_account.name
    storage_container_name = azurerm_storage_container.storage_container.name
    type                   = "Block"
    source                 = "${path.module}"/"product.json"
    depends_on             = [ azurerm_storage_container.storage_container ]
}