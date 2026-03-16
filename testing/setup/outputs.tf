output "resource_group_name" {
  value = azurerm_resource_group.test.name
}

output "virtual_network_id" {
  value = azurerm_virtual_network.test.id
}

output "location" {
  value = azurerm_resource_group.test.location
}

output "virtual_network" {
  value = {
    id   = azurerm_virtual_network.test.id
    name = azurerm_virtual_network.test.name
  }
}
