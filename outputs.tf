output "id" {
  value = azurerm_private_dns_resolver.main.id
}
output "name" {
  value = azurerm_private_dns_resolver.main.name
}
output "inbound_subnet" {
  value = {
    id       = azurerm_subnet.inbound.id
    name     = azurerm_subnet.inbound.name
    location = var.location
  }
}
output "outbound_subnet" {
  value = {
    id       = azurerm_subnet.outbound.id
    name     = azurerm_subnet.outbound.name
    location = var.location
  }
}
