output "ip" {
  description = "Public IP"
  value       = azurerm_public_ip.create_public_ip
}

output "ip_id" {
  description = "Public IP ID"
  value       = azurerm_public_ip.create_public_ip.id
}

output "ip_address" {
  description = "IP address"
  value       = azurerm_public_ip.create_public_ip.ip_address
}

output "ip_sku" {
  description = "Public IP SKU"
  value       = azurerm_public_ip.create_public_ip.sku
}
