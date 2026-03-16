resource "azurerm_private_dns_resolver" "main" {

  name                = "dnspr-${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_network_id  = var.virtual_network.id

}

resource "azurerm_private_dns_resolver_inbound_endpoint" "main" {

  name                    = "${azurerm_private_dns_resolver.main.name}-inbound"
  private_dns_resolver_id = azurerm_private_dns_resolver.main.id
  location                = azurerm_private_dns_resolver.main.location

  ip_configurations {
    private_ip_allocation_method = "Dynamic"
    subnet_id                    = azurerm_subnet.inbound.id
  }

}

resource "azurerm_private_dns_resolver_outbound_endpoint" "main" {
  name                    = "${azurerm_private_dns_resolver.main.name}-outbound"
  private_dns_resolver_id = azurerm_private_dns_resolver.main.id
  location                = azurerm_private_dns_resolver.main.location
  subnet_id               = azurerm_subnet.outbound.id
}
