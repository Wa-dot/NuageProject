output "dns_private_zone_id" {
  description = "ID of the DNS private zone"
  value       = azurerm_private_dns_zone.dns.id
}

output "postgresql_server_fqdn" {
  description = "DNS name of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.postgresql.fqdn
}

output "postgresql_server_id" {
  description = "ID of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.postgresql.id
}

output "database_id" {  
  description = "ID of the created PostgreSQL database"
  value       = azurerm_postgresql_flexible_server.postgresql.id
}