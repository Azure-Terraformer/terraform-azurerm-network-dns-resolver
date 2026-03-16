resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "test" {
  name     = "rg-${var.name_prefix}-${random_string.suffix.result}"
  location = var.location
}

resource "azurerm_virtual_network" "test" {
  name                = "vnet-${var.name_prefix}-${random_string.suffix.result}"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  address_space       = [var.address_space]
}
