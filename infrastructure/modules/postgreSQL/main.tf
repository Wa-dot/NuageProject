resource "azurerm_private_dns_zone" "np_dns" {
  name                = "np-domain.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.example.name # à modifier
}

resource "azurerm_postgresql_flexible_server" "np_postgresql" {
  name                          = var.np_postgresql_server_name
  location                      = var.np_physical_loc
  version                       = var.np_db_version
  resource_group_name           = var.np_rg_name
  delegated_subnet_id           = var.np_delegated_subnet_id
  private_dns_zone_id           = azurerm_private_dns_zone.np_dns.id
  administrator_login           = var.np_admin_username
  administrator_password        = var.np_admin_password
  storage_mb   = var.np_storage_mb
  sku_name   = var.np_sku_name

  public_network_access_enabled = false

}

resource "azurerm_postgresql_flexible_server_database" "np_database" {
  name      = var.np_db_name
  server_id = azurerm_postgresql_flexible_server.np_postgresql.id
  collation = "en_US.utf8"
  charset   = "utf8"
}