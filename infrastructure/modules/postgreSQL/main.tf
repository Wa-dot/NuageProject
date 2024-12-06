resource "azurerm_private_dns_zone" "dns" {
  name                   = "np-domain.postgres.database.azure.com"
  resource_group_name    = azurerm_resource_group.example.name # à modifier
}

resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                   = var.postgresql_server_name
  location               = var.location
  version                = var.db_version
  resource_group_name    = var.resource_group_name
  private_dns_zone_id    = azurerm_private_dns_zone.dns.id
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  storage_mb             = var.storage_mb
  sku_name               = var.sku_name

  public_network_access_enabled = false

}

resource "azurerm_postgresql_flexible_server_database" "database" {
  name                   = var.db_name
  server_id              = azurerm_postgresql_flexible_server.postgresql.id
  collation              = "en_US.utf8"
  charset                = "utf8"
}