output "dns_private_zone_id" {
    description = "ID of the dns private zone"
    value = azurerm_private_dns_zone.np_dns.id
}

output "postgresql_server_fqdn" {
  description = "DNS complete name of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.np_postgresql.fqdn
}

output "postgresql_server_id" {
  description = "ID of the Flexible PostgreSQL"
  value       = azurerm_postgresql_flexible_server.np_postgresql.id
}

output "database_id" {
  description = "Name of the created database in the server"
  value       = azurerm_postgresql_flexible_server_database.np_database.id
}