output "container_instance_fqdn" {
  value       = azurerm_container_group.main.fqdn
  description = "The FQDN of the Container Instance"
}

output "container_instance_url" {
  value       = "http://${azurerm_container_group.main.fqdn}"
  description = "The URL to access the Container Instance"
}
